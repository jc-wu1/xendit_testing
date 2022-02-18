import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:xendit_testing/src/data/datasources/payment_channel_datasource.dart';
import 'package:xendit_testing/src/data/repositories/payment_channel_repository_impl.dart';
import 'package:xendit_testing/src/domain/repositories/payment_channel_repository.dart';
import 'package:xendit_testing/src/domain/usecases/get_payment_channel_usecase.dart';
import 'package:xendit_testing/src/presentation/payment_screen/bloc/payment_channel_bloc.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dio client
  injector.registerSingleton<Dio>(Dio());

  // Dependencies
  injector.registerSingleton<PaymentChannelApiService>(
    PaymentChannelApiService(injector()),
  );
  injector.registerSingleton<PaymentChannelRepository>(
    PaymentChannelRepositoryImpl(injector()),
  );

  // UseCases
  injector.registerSingleton<GetPaymentChannelUsecase>(
      GetPaymentChannelUsecase(injector()));

  // Blocs
  injector.registerFactory<PaymentChannelBloc>(
    () => PaymentChannelBloc(injector()),
  );
}
