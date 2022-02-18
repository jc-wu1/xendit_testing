import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xendit_testing/src/presentation/injector.dart';
import 'package:xendit_testing/src/presentation/payment_screen/bloc/invoice_bloc.dart';

class PaymentScreen extends StatefulWidget {
  final int index;
  final double price;
  const PaymentScreen({
    Key? key,
    required this.index,
    required this.price,
  }) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> body = {
      "external_id": "invoice-${widget.index}",
      "amount": widget.price,
      "payer_email": "customer@domain.com",
      "description": "Pembayaran Untuk Invoice Nomor #${widget.index}",
      "items": [
        {
          "name": "Bayar Test",
          "quantity": 1,
          "price": widget.price,
          "category": "Testing"
        }
      ],
      "payment_methods": ["BCA", "BNI", "BRI", "MANDIRI", "PERMATA"],
      "locale": "id",
    };
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Choose Payment Method',
        ),
        centerTitle: true,
      ),
      body: BlocProvider<InvoiceBloc>(
        create: (_) => injector()..add(CreateInvoiceRequested(body)),
        child: BlocBuilder<InvoiceBloc, InvoiceState>(
          builder: (context, state) {
            if (state is CreateInvoiceLoadInProgress) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is CreateInvoiceLoadComplete) {
              return const Center(
                child: Text('OK'),
              );
            } else if (state is CreateInvoiceLoadFailure) {
              return const Center(
                child: Text('Fail'),
              );
            }
            return const Center(
              child: Text('state unknown'),
            );
          },
        ),
      ),
    );
  }
}
