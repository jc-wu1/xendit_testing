import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:xendit_testing/src/core/data_model.dart';
import 'package:xendit_testing/src/domain/usecases/get_payment_channel_usecase.dart';

part 'payment_channel_event.dart';
part 'payment_channel_state.dart';

class PaymentChannelBloc
    extends Bloc<PaymentChannelEvent, PaymentChannelState> {
  PaymentChannelBloc(this.getPaymentChannelUsecase)
      : super(PaymentChannelInitial()) {
    on<PaymentChannelFetched>(_onPaymentChannelFetched);
  }
  final GetPaymentChannelUsecase getPaymentChannelUsecase;

  Future<void> _onPaymentChannelFetched(
    PaymentChannelEvent event,
    Emitter<PaymentChannelState> emit,
  ) async {
    emit(PaymentChannelLoadInProgress());
    try {
      final dataState = await getPaymentChannelUsecase.call();
      if (dataState is DataSuccess) {
        final paymentChannel = dataState.data;
        emit(PaymentChannelLoadComplete(paymentChannel!));
      } else {
        emit(PaymentChannelLoadFailure());
      }
    } catch (e) {
      emit(PaymentChannelLoadFailure());
    }
  }
}
