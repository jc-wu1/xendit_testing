import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:xendit_testing/src/core/data_model.dart';
import 'package:xendit_testing/src/domain/entities/va_account_entity.dart';
import 'package:xendit_testing/src/domain/usecases/create_va_usecase.dart';

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc(this.createVaPaymentUsecase) : super(PaymentInitial()) {
    on<CreateVaPaymentRequested>(_onCreateVaPaymentRequested);
  }

  final CreateVaPaymentUsecase createVaPaymentUsecase;

  void _onCreateVaPaymentRequested(
    CreateVaPaymentRequested event,
    Emitter<PaymentState> emit,
  ) async {
    emit(CreateVaPaymentLoadInProgress());
    try {
      final dataState = await createVaPaymentUsecase.call(
        params: event.params,
      );

      // print(createQr.data);
      if (dataState is DataSuccess<VaAccountEntity>) {
        final vaPayment = dataState.data;
        emit(CreateVaPaymentLoadComplete(vaPayment!));
      } else {
        emit(CreateVaPaymentLoadFailure());
      }
    } catch (e, stacktrace) {
      print(e);
      print(stacktrace);
      emit(CreateVaPaymentLoadFailure());
    }
  }
}
