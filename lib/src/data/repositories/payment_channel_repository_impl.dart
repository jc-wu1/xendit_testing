import 'dart:io';

import 'package:dio/dio.dart';
import 'package:xendit_testing/src/data/datasources/payment_channel_datasource.dart';
import 'package:xendit_testing/src/domain/entities/payment_channel_entity.dart';
import 'package:xendit_testing/src/core/data_model.dart';
import 'package:xendit_testing/src/domain/repositories/payment_channel_repository.dart';

class PaymentChannelRepositoryImpl implements PaymentChannelRepository {
  final PaymentChannelApiService _paymentChannelApiService;

  const PaymentChannelRepositoryImpl(this._paymentChannelApiService);

  @override
  Future<DataState<List<PaymentChannelEntity>>> getPaymentChannels() async {
    try {
      final httpResponse = await _paymentChannelApiService.getPaymentChannel();
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailure(
          DioError(
            error: httpResponse.response.statusMessage,
            requestOptions: httpResponse.response.requestOptions,
            response: httpResponse.response,
            type: DioErrorType.response,
          ),
        );
      }
    } on DioError catch (e) {
      return DataFailure(e);
    }
  }
}
