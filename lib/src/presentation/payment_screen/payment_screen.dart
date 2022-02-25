import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xendit_testing/src/presentation/injector.dart';
import 'package:xendit_testing/src/presentation/payment_screen/bloc/payment_bloc.dart';

class PaymentScreen extends StatefulWidget {
  final String bankCode;
  final String expiredDate;
  final num amount;
  final String externalId;
  const PaymentScreen({
    Key? key,
    required this.bankCode,
    required this.expiredDate,
    required this.amount,
    required this.externalId,
  }) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> vaPayment = {
      "external_id": widget.externalId,
      "bank_code": widget.bankCode,
      "name": "PT Testing Bersama",
      "is_single_use": true,
      "is_closed": true,
      "expected_amount": widget.amount,
      "expiration_date": widget.expiredDate,
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pay with VA'),
      ),
      body: BlocProvider<PaymentBloc>(
        create: (_) => injector()..add(CreateVaPaymentRequested(vaPayment)),
        child: BlocBuilder<PaymentBloc, PaymentState>(
          builder: (context, state) {
            if (state is CreateVaPaymentLoadComplete) {
              var va = state.vaAccount;
              return Column(
                children: [
                  Text('Account number: ${va.accountNumber}'),
                  Text('BANK: ${va.bankCode}'),
                  Text('Amount: ${va.expectedAmount}'),
                  Text('Yg perlu dibayarkan: ${va.name}'),
                ],
              );
            } else if (state is CreateVaPaymentLoadInProgress) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is CreateVaPaymentLoadFailure) {
              return const Center(
                child: Text('Fail'),
              );
            }
            return const Center(
              child: Text('Unknown State'),
            );
          },
        ),
      ),
    );
  }
}
