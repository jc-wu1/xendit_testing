import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:xendit_testing/src/core/data_model.dart';
import 'package:xendit_testing/src/domain/entities/payment_invoice_entity.dart';
import 'package:xendit_testing/src/domain/entities/qr_payment_entity.dart';
import 'package:xendit_testing/src/domain/usecases/create_invoice_usecase.dart';
import 'package:xendit_testing/src/domain/usecases/create_qr_payment_usecase.dart';

part 'invoice_event.dart';
part 'invoice_state.dart';

class InvoiceBloc extends Bloc<InvoiceEvent, InvoiceState> {
  InvoiceBloc(
    this.createInvoiceUsecase,
    this.createQrCodePaymentUsecase,
  ) : super(InvoiceInitial()) {
    on<CreateInvoiceRequested>(_onCreateInvoiceRequested);
  }

  final CreateInvoiceUsecase createInvoiceUsecase;
  final CreateQrCodePaymentUsecase createQrCodePaymentUsecase;

  void _onCreateInvoiceRequested(
    CreateInvoiceRequested event,
    Emitter<InvoiceState> emit,
  ) async {
    emit(CreateInvoiceLoadInProgress());
    try {
      final dataState = await createInvoiceUsecase.call(
        params: event.params,
      );
      // final createQr = await createQrCodePaymentUsecase.call(
      //   params: event.qrCode,
      // );
      // print(createQr.data);
      if (dataState is DataSuccess<PaymentInvoiceEntity>) {
        final paymentInvoice = dataState.data;
        // final qrCode = createQr.data;
        emit(CreateInvoiceLoadComplete(paymentInvoice!));
      } else {
        emit(CreateInvoiceLoadFailure());
      }
    } catch (e) {
      emit(CreateInvoiceLoadFailure());
    }
  }
}
