import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:xendit_testing/src/core/dio_interceptor.dart';
import 'package:xendit_testing/src/data/datasources/invoice_api_services.dart';
import 'package:xendit_testing/src/data/repositories/invoice_repository.dart';
import 'package:xendit_testing/src/domain/repositories/invoice_repository.dart';
import 'package:xendit_testing/src/domain/usecases/create_invoice_usecase.dart';
import 'package:xendit_testing/src/presentation/payment_screen/bloc/invoice_bloc.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dio client
  injector.registerSingleton<Dio>(Dio());

  // Dependencies
  injector
      .registerSingleton<InvoiceApiServices>(InvoiceApiServices(injector()));
  injector
      .registerSingleton<InvoiceRepository>(InvoiceRepositoryImpl(injector()));
  // UseCases
  injector.registerSingleton<CreateInvoiceUsecase>(
      CreateInvoiceUsecase(injector()));

  // Blocs
  injector.registerFactory<InvoiceBloc>(() => InvoiceBloc(injector()));
}
