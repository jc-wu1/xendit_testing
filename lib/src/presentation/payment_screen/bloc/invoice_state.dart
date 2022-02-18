part of 'invoice_bloc.dart';

abstract class InvoiceState extends Equatable {
  const InvoiceState();

  @override
  List<Object> get props => [];
}

class InvoiceInitial extends InvoiceState {}

class CreateInvoiceLoadInProgress extends InvoiceState {}

class CreateInvoiceLoadComplete extends InvoiceState {
  final PaymentInvoiceEntity paymentInvoice;

  const CreateInvoiceLoadComplete(this.paymentInvoice);

  @override
  List<Object> get props => [paymentInvoice];
}

class CreateInvoiceLoadFailure extends InvoiceState {}
