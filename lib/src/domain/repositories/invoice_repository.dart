import 'package:xendit_testing/src/core/data_model.dart';
import 'package:xendit_testing/src/domain/entities/payment_invoice_entity.dart';

abstract class InvoiceRepository {
  Future<DataState<PaymentInvoiceEntity>> createInvoice(
    Map<String, dynamic> param,
  );
}
