part of 'payment_bloc.dart';

abstract class PaymentState extends Equatable {
  const PaymentState();

  @override
  List<Object> get props => [];
}

class PaymentInitial extends PaymentState {}

class CreateVaPaymentLoadInProgress extends PaymentState {}

class CreateVaPaymentLoadComplete extends PaymentState {
  final VaAccountEntity vaAccount;
  const CreateVaPaymentLoadComplete(this.vaAccount);

  @override
  List<Object> get props => [vaAccount];
}

class CreateVaPaymentLoadFailure extends PaymentState {}
