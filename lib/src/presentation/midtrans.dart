import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MidtransPayment extends StatefulWidget {
  const MidtransPayment({Key? key}) : super(key: key);

  @override
  State<MidtransPayment> createState() => _MidtransPaymentState();
}

class _MidtransPaymentState extends State<MidtransPayment> {
  static const platform = MethodChannel("co.id.portocustomer/paymentchannel");
  String _res = 'Unknown.';

  Future<void> _getResult() async {
    String res;
    try {
      final String result = await platform.invokeMethod('paymentMethodA');
      res = 'Get result $result';
    } on PlatformException catch (e) {
      res = "Failed to get result: '${e.message}'.";
    }

    setState(() {
      _res = res;
    });
  }

  Future<void> testPayment() async {
    String res;
    try {
      final String result = await platform.invokeMethod('testPayment');
      res = 'Get result $result';
    } on PlatformException catch (e) {
      res = "Failed to get result: '${e.message}'.";
    }

    setState(() {
      _res = res;
    });
  }

  @override
  void initState() {
    super.initState();
    initSdk();
  }

  Future<void> initSdk() async {
    try {
      await platform.invokeMethod('init');
    } on PlatformException catch (e) {
      print(e.stacktrace);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plugin example app'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(_res),
            ElevatedButton(
              child: Text("Pay Now"),
              onPressed: _getResult,
            ),
            ElevatedButton(
              child: Text("Pay Now"),
              onPressed: testPayment,
            ),
          ],
        ),
      ),
    );
  }
}
