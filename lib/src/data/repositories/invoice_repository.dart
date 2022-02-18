import 'dart:io';

import 'package:dio/dio.dart';
import 'package:xendit_testing/src/data/datasources/invoice_api_services.dart';
import 'package:xendit_testing/src/domain/entities/payment_invoice_entity.dart';
import 'package:xendit_testing/src/core/data_model.dart';
import 'package:xendit_testing/src/domain/repositories/invoice_repository.dart';

class InvoiceRepositoryImpl implements InvoiceRepository {
  final InvoiceApiServices invoiceApiServices;

  InvoiceRepositoryImpl(this.invoiceApiServices);

  @override
  Future<DataState<PaymentInvoiceEntity>> createInvoice(
      Map<String, dynamic> param) async {
    try {
      final httpResponse = await invoiceApiServices.createInvoice(param);
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
