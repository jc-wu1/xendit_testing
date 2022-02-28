import 'package:flutter/material.dart';

class MidtransPayment extends StatefulWidget {
  const MidtransPayment({Key? key}) : super(key: key);

  @override
  State<MidtransPayment> createState() => _MidtransPaymentState();
}

class _MidtransPaymentState extends State<MidtransPayment> {
  @override
  void initState() {
    super.initState();
    initSDK();
  }

  void initSDK() async {}

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plugin example app'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Pay Now"),
          onPressed: () async {},
        ),
      ),
    );
  }
}
