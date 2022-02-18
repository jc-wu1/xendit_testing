import 'package:xendit_testing/src/core/data_model.dart';
import 'package:xendit_testing/src/domain/entities/payment_channel_entity.dart';

abstract class PaymentChannelRepository {
  Future<DataState<List<PaymentChannelEntity>>> getPaymentChannels();
}
