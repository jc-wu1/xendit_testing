import 'package:xendit_testing/src/core/data_model.dart';
import 'package:xendit_testing/src/core/usecase.dart';
import 'package:xendit_testing/src/domain/entities/va_account_entity.dart';
import 'package:xendit_testing/src/domain/repositories/invoice_repository.dart';

class CreateVaPaymentUsecase
    implements UseCase<DataState<VaAccountEntity>, Map<String, dynamic>> {
  final InvoiceRepository invoiceRepository;

  CreateVaPaymentUsecase(this.invoiceRepository);

  @override
  Future<DataState<VaAccountEntity>> call({
    required Map<String, dynamic> params,
  }) async {
    return invoiceRepository.createVaPayment(params);
  }
}
