import 'package:xendit_testing/src/core/data_model.dart';
import 'package:xendit_testing/src/core/usecase.dart';
import 'package:xendit_testing/src/domain/entities/qr_payment_entity.dart';
import 'package:xendit_testing/src/domain/repositories/invoice_repository.dart';

class CreateQrCodePaymentUsecase
    implements UseCase<DataState<QrPaymentEntity>, Map<String, dynamic>> {
  final InvoiceRepository invoiceRepository;

  CreateQrCodePaymentUsecase(this.invoiceRepository);
  @override
  Future<DataState<QrPaymentEntity>> call({
    required Map<String, dynamic> params,
  }) async {
    return invoiceRepository.createQrPayment(params);
  }
}
