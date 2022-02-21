import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:xendit_testing/src/presentation/injector.dart';
import 'package:xendit_testing/src/presentation/invoice_screen/bloc/invoice_bloc.dart';
import 'package:xendit_testing/src/presentation/payment_screen/payment_screen.dart';

class PaymentMethodScreen extends StatefulWidget {
  final int index;
  final double price;
  const PaymentMethodScreen({
    Key? key,
    required this.index,
    required this.price,
  }) : super(key: key);

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
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

    Map<String, dynamic> qrCode = {
      "external_id": "invoice-${widget.index}",
      "type": "DYNAMIC",
      "callback_url": "https://701b-140-213-0-172.ngrok.io",
      "amount": widget.price
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Choose Payment Method',
        ),
        centerTitle: true,
      ),
      body: BlocProvider<InvoiceBloc>(
        create: (_) => injector()..add(CreateInvoiceRequested(body, qrCode)),
        child: BlocBuilder<InvoiceBloc, InvoiceState>(
          builder: (context, state) {
            if (state is CreateInvoiceLoadInProgress) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is CreateInvoiceLoadComplete) {
              var paymentInvoice = state.paymentInvoice;
              // var qr = state.qrCode;
              return Column(
                children: [
                  Text(paymentInvoice.merchantName),
                  Text('Invoice id: ${paymentInvoice.id}'),
                  Text('Eksternal id: ${paymentInvoice.externalId}'),
                  Text('Bayar sebelum tanggal: ${paymentInvoice.expiryDate}'),
                  Text('Yg perlu dibayarkan: ${paymentInvoice.amount}'),
                  const Text('Metode pembayaran yang tersedia'),
                  Flexible(
                    child: ListView.builder(
                      itemCount: paymentInvoice.availableBanks.length,
                      itemBuilder: (BuildContext context, int index) {
                        var availableBank =
                            paymentInvoice.availableBanks[index];
                        return ListTile(
                          title: Text(availableBank.bankBranch),
                          subtitle: Text(availableBank.bankCode),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PaymentScreen(
                                  bankCode: availableBank.bankCode,
                                  amount: paymentInvoice.amount,
                                  expiredDate: paymentInvoice.expiryDate,
                                  externalId: paymentInvoice.externalId,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  const Text('Ringkasan pesanan'),
                  Flexible(
                    child: ListView.builder(
                      itemCount: paymentInvoice.items.length,
                      itemBuilder: (BuildContext context, int index) {
                        var item = paymentInvoice.items[index];
                        return ListTile(
                          title: Text('Nama item: ${item.name}'),
                          subtitle: Text('Harga: ${item.price}'),
                          onTap: () {},
                        );
                      },
                    ),
                  ),
                  // QrImage(
                  //   data: qr.qrString,
                  //   version: QrVersions.auto,
                  //   size: 200.0,
                  // ),
                ],
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
