import 'package:flutter/material.dart';
import 'package:xendit_testing/src/presentation/invoice_screen/view/payment_channel_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int harga = 1000000;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text('Barang ${index + 1}'),
              subtitle: Text('Harga Rp${harga * (index + 1)}'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentMethodScreen(
                      index: index + 1,
                      price: harga * (index + 1),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
