// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_api_services.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _InvoiceApiServices implements InvoiceApiServices {
  _InvoiceApiServices(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://api.xendit.co';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<HttpResponse<PaymentInvoiceModel>> createInvoice(params) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Authorization':
          'Basic eG5kX2RldmVsb3BtZW50X3R5Z0FIR0xGejdSaVl1d2E2cWpES2cxanZ4UXlYSU0wbENPcVRxc2hmRkRFZ2E4enJycm1rS3JWQldoTm5yd3k6Og==',
      r'Content-Type': 'application/json'
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(params);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<PaymentInvoiceModel>>(Options(
                method: 'POST',
                headers: _headers,
                extra: _extra,
                contentType: 'application/json')
            .compose(_dio.options, '/v2/invoices',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = PaymentInvoiceModel.fromJson(_result.data!);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
