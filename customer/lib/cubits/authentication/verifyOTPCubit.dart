// ignore_for_file: file_names

import 'package:e_demand/analytics/analytics_events.dart';
import 'package:e_demand/analytics/clarity_service.dart';
import 'package:e_demand/app/generalImports.dart';

abstract class VerifyOtpState {}

class VerifyOtpInitial extends VerifyOtpState {}

class VerifyOtpInProcess extends VerifyOtpState {}

class VerifyOtpSuccess extends VerifyOtpState {
  VerifyOtpSuccess(
      {this.signinCredential, this.message, required this.authenticationType});

  final String? message;
  final String authenticationType;
  UserCredential? signinCredential;
}

class VerifyOtpFail extends VerifyOtpState {
  VerifyOtpFail(this.error);

  final dynamic error;
}

class VerifyOtpCubit extends Cubit<VerifyOtpState> {
  VerifyOtpCubit() : super(VerifyOtpInitial());
  final AuthenticationRepository authRepo = AuthenticationRepository();

  Future<void> verifyOtp({
    required String otp,
    required String authenticationType,
    required String countryCode,
    required String mobileNumber,
  }) async {
    try {
      emit(VerifyOtpInProcess());
      if (authenticationType == "sms_gateway") {
        final Map<String, dynamic> response =
            await authRepo.verifyOTPUsingSMSGateway(
          otp: otp,
          mobileNumber: mobileNumber,
          countryCode: countryCode,
        );
        if (response["error"]) {
          ClarityService.logAction(
            ClarityActions.loginFailure,
            {
              'stage': 'verify_otp',
              'auth_type': authenticationType,
              'mobile_number': mobileNumber,
              'error_message': response['message'].toString(),
            },
          );
          emit(VerifyOtpFail(response["message"]));
        } else {
          ClarityService.logAction(
            ClarityActions.otpVerified,
            {
              'auth_type': authenticationType,
              'mobile_number': mobileNumber,
            },
          );
          emit(VerifyOtpSuccess(
            authenticationType: authenticationType,
            message: response["message"],
          ));
        }
      } else {
        final UserCredential userCredential =
            await authRepo.verifyOtpUsingFirebase(
          code: otp,
        );
        ClarityService.logAction(
          ClarityActions.otpVerified,
          {
            'auth_type': authenticationType,
            'uid': userCredential.user?.uid ?? '',
          },
        );
        emit(VerifyOtpSuccess(
          signinCredential: userCredential,
          message: "otpVerifiedSuccessfully",
          authenticationType: authenticationType,
        ));
      }
      await FirebaseAnalytics.instance.logLogin(
          loginMethod: 'OTP',
          parameters: {'authenticationType': authenticationType});
    } on FirebaseAuthException catch (error) {
      ClarityService.logAction(
        ClarityActions.loginFailure,
        {
          'stage': 'verify_otp',
          'auth_type': authenticationType,
          'error_code': error.code,
        },
      );
      emit(VerifyOtpFail(error.code));
    } catch (e) {
      ClarityService.logAction(
        ClarityActions.loginFailure,
        {
          'stage': 'verify_otp',
          'auth_type': authenticationType,
          'error_message': e.toString(),
        },
      );
      emit(VerifyOtpFail(e));
    }
  }

  void setInitialState() {
    if (state is VerifyOtpFail) {
      emit(VerifyOtpInitial());
    }
    if (state is VerifyOtpSuccess) {
      emit(VerifyOtpInitial());
    }
  }
}
