import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xendit_testing/src/presentation/injector.dart';
import 'package:xendit_testing/src/presentation/payment_screen/bloc/payment_channel_bloc.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Choose Payment Method',
        ),
        centerTitle: true,
      ),
      body: BlocProvider<PaymentChannelBloc>(
        create: (_) => injector()..add(PaymentChannelFetched()),
        child: BlocBuilder<PaymentChannelBloc, PaymentChannelState>(
          builder: (context, state) {
            if (state is PaymentChannelLoadInProgress) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is PaymentChannelLoadComplete) {
              return ListView.builder(
                itemCount: state.paymentChannels.length,
                itemBuilder: (BuildContext context, int index) {
                  final paymentChannel = state.paymentChannels[index];
                  return ListTile(
                    title: Text(paymentChannel.name),
                    subtitle: Text(paymentChannel.channel_category),
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => const PaymentScreen(),
                      //   ),
                      // );
                    },
                    enabled: paymentChannel.channel_category == 'CREDIT_CARD'
                        ? false
                        : paymentChannel.channel_category == 'EWALLET'
                            ? false
                            : true,
                  );
                },
              );
            } else {
              return const Center(child: Text("error"));
            }
          },
        ),
      ),
    );
  }
}
