import 'package:dio/dio.dart' hide Headers;
import 'package:xendit_testing/src/core/api_const.dart';
import 'package:retrofit/retrofit.dart';
import 'package:xendit_testing/src/data/models/payment_invoice_model.dart';
import 'package:xendit_testing/src/data/models/qr_payment_model.dart';
import 'package:xendit_testing/src/data/models/va_account_model.dart';

part 'invoice_api_services.g.dart';

@RestApi(baseUrl: apiUrl)
abstract class InvoiceApiServices {
  factory InvoiceApiServices(Dio dio, {String baseUrl}) = _InvoiceApiServices;

  @POST('/v2/invoices')
  @Headers(headers)
  Future<HttpResponse<PaymentInvoiceModel>> createInvoice(
    @Body() Map<String, dynamic> params,
  );

  @POST('/qr_codes')
  @Headers(headers)
  Future<HttpResponse<QrPaymentModel>> createQrPayment(
    @Body() Map<String, dynamic> params,
  );

  @POST('/callback_virtual_accounts')
  @Headers(headers)
  Future<HttpResponse<VaAccountModel>> createVaPayment(
    @Body() Map<String, dynamic> params,
  );
}
