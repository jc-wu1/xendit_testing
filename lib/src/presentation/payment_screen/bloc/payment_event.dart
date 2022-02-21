part of 'payment_bloc.dart';

abstract class PaymentEvent extends Equatable {
  const PaymentEvent();

  @override
  List<Object> get props => [];
}

class CreateVaPaymentRequested extends PaymentEvent {
  const CreateVaPaymentRequested(this.params);

  final Map<String, dynamic> params;
}
