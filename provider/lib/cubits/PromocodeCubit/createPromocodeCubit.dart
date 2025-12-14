import '../../../app/generalImports.dart';
import '../../analytics/analytics_events.dart';
import '../../analytics/analytics_helper.dart';

abstract class CreatePromocodeState {}

class CreatePromocodeInitial extends CreatePromocodeState {}

class CreatePromocodeInProgress extends CreatePromocodeState {}

class CreatePromocodeSuccess extends CreatePromocodeState {
  final PromocodeModel promocode;
  final String? id;

  CreatePromocodeSuccess({this.id, required this.promocode});
}

class CreatePromocodeFailure extends CreatePromocodeState {
  final String errorMessage;

  CreatePromocodeFailure(this.errorMessage);
}

class CreatePromocodeCubit extends Cubit<CreatePromocodeState> {
  final PromocodeRepository _promocodeRepository = PromocodeRepository();

  CreatePromocodeCubit() : super(CreatePromocodeInitial());

  Future<void> createPromocode(CreatePromocodeModel model) async {
    try {
      emit(CreatePromocodeInProgress());
      final result = await _promocodeRepository.createPromocode(model);
      final promocode = PromocodeModel.fromJson(result[0]);

      // Log promocode creation
      AnalyticsHelper.logEvent(
        ClarityActions.promocodeCreated,
        parameters: {
          'promocode_id':
              promocode.id?.toString() ?? model.promo_id?.toString() ?? '',
          'promocode_name': promocode.promoCode ?? '',
          'discount': promocode.discount ?? '',
          'discount_type': promocode.discountType ?? '',
        },
      );

      emit(CreatePromocodeSuccess(id: model.promo_id, promocode: promocode));
    } catch (e) {
      emit(CreatePromocodeFailure(e.toString()));
    }
  }
}
