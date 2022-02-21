import 'package:xendit_testing/src/core/data_model.dart';
import 'package:xendit_testing/src/domain/entities/payment_invoice_entity.dart';
import 'package:xendit_testing/src/domain/entities/qr_payment_entity.dart';
import 'package:xendit_testing/src/domain/entities/va_account_entity.dart';

abstract class InvoiceRepository {
  Future<DataState<PaymentInvoiceEntity>> createInvoice(
    Map<String, dynamic> param,
  );

  Future<DataState<QrPaymentEntity>> createQrPayment(
    Map<String, dynamic> param,
  );

  Future<DataState<VaAccountEntity>> createVaPayment(
    Map<String, dynamic> param,
  );
}
