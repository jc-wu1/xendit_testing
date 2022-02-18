import 'package:xendit_testing/src/core/data_model.dart';
import 'package:xendit_testing/src/core/no_param.dart';
import 'package:xendit_testing/src/core/usecase.dart';
import 'package:xendit_testing/src/domain/entities/payment_channel_entity.dart';
import 'package:xendit_testing/src/domain/repositories/payment_channel_repository.dart';

class GetPaymentChannelUsecase
    implements UseCase<DataState<List<PaymentChannelEntity>>, NoParams> {
  final PaymentChannelRepository paymentChannelRepository;

  GetPaymentChannelUsecase(this.paymentChannelRepository);

  @override
  Future<DataState<List<PaymentChannelEntity>>> call({
    NoParams? params,
  }) {
    return paymentChannelRepository.getPaymentChannels();
  }
}
