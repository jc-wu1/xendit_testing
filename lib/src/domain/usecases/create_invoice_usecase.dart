import 'package:xendit_testing/src/core/data_model.dart';
import 'package:xendit_testing/src/core/usecase.dart';
import 'package:xendit_testing/src/domain/entities/payment_invoice_entity.dart';
import 'package:xendit_testing/src/domain/repositories/invoice_repository.dart';

class CreateInvoiceUsecase
    implements UseCase<DataState<PaymentInvoiceEntity>, Map<String, dynamic>> {
  final InvoiceRepository invoiceRepository;

  CreateInvoiceUsecase(this.invoiceRepository);

  @override
  Future<DataState<PaymentInvoiceEntity>> call({
    required Map<String, dynamic> params,
  }) async {
    return invoiceRepository.createInvoice(params);
  }
}
