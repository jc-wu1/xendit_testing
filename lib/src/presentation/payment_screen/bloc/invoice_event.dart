part of 'invoice_bloc.dart';

abstract class InvoiceEvent extends Equatable {
  const InvoiceEvent();

  @override
  List<Object> get props => [];
}

class CreateInvoiceRequested extends InvoiceEvent {
  const CreateInvoiceRequested(this.params);

  final Map<String, dynamic> params;
}
