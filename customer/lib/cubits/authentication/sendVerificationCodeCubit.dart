import 'package:e_demand/analytics/analytics_events.dart';
import 'package:e_demand/analytics/clarity_service.dart';
import 'package:e_demand/app/generalImports.dart';

abstract class SendVerificationCodeState {}

class SendVerificationCodeInitialState extends SendVerificationCodeState {}

class SendVerificationCodeInProgressState extends SendVerificationCodeState {}

class SendVerificationCodeSuccessState extends SendVerificationCodeState {
  final String phoneNumber;
  final String userAuthenticationCode;
  final String authenticationType;

  SendVerificationCodeSuccessState(
      {required this.phoneNumber,
      required this.userAuthenticationCode,
      required this.authenticationType});
}

class SendVerificationCodeFailureState extends SendVerificationCodeState {
  SendVerificationCodeFailureState(this.error);

  final dynamic error;
}

class SendVerificationCodeCubit extends Cubit<SendVerificationCodeState> {
  SendVerificationCodeCubit() : super(SendVerificationCodeInitialState());
  final AuthenticationRepository authRepo = AuthenticationRepository();

  Future<void> sendVerificationCode({
    required final String phoneNumber,
    required final String userAuthenticationCode,
    required final String authenticationType,
  }) async {
    try {
      emit(SendVerificationCodeInProgressState());
      await authRepo.verifyPhoneNumber(
        phoneNumber,
        onError: (final error) {
          ClarityService.logAction(
            ClarityActions.loginFailure,
            {
              'stage': 'send_code',
              'phone_number': phoneNumber,
              'auth_type': authenticationType,
              'error_code': error.code,
            },
          );
          emit(SendVerificationCodeFailureState(error.code));
        },
        onCodeSent: () {
          ClarityService.logAction(
            ClarityActions.otpSent,
            {
              'phone_number': phoneNumber,
              'auth_type': authenticationType,
            },
          );
          ClarityService.logAction(
            ClarityActions.loginAttempt,
            {
              'phone_number': phoneNumber,
              'auth_type': authenticationType,
            },
          );
          emit(SendVerificationCodeSuccessState(
            phoneNumber: phoneNumber,
            userAuthenticationCode: userAuthenticationCode,
            authenticationType: authenticationType,
          ));
        },
      );
    } on FirebaseAuthException catch (error) {
      ClarityService.logAction(
        ClarityActions.loginFailure,
        {
          'stage': 'send_code',
          'phone_number': phoneNumber,
          'auth_type': authenticationType,
          'error_code': error.code,
        },
      );
      emit(SendVerificationCodeFailureState(error.code));
    } catch (error) {
      ClarityService.logAction(
        ClarityActions.loginFailure,
        {
          'stage': 'send_code',
          'phone_number': phoneNumber,
          'auth_type': authenticationType,
          'error_message': error.toString(),
        },
      );
      emit(SendVerificationCodeFailureState(error));
    }
  }

  void setInitialState() {
    if (state is SendVerificationCodeSuccessState) {
      emit(SendVerificationCodeInitialState());
    }
  }
}
