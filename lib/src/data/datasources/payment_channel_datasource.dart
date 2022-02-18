// import 'package:dio/dio.dart' hide Headers;
// import 'package:retrofit/retrofit.dart';
// import 'package:xendit_testing/src/core/api_const.dart';
// import 'package:xendit_testing/src/data/models/payment_channel_model/payment_channel_model.dart';

// part 'payment_channel_datasource.g.dart';

// @RestApi(baseUrl: apiUrl)
// abstract class PaymentChannelApiService {
//   factory PaymentChannelApiService(Dio dio, {String baseUrl}) =
//       _PaymentChannelApiService;

//   @POST('/v2/invoices')
//   @Headers(headers)
//   Future<HttpResponse<PaymentChannelModel>> createInvoice(
//     @Body() CreateInvoice body,
//   );
// }
