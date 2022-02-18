import 'package:flutter/material.dart';
import 'package:xendit_testing/src/presentation/homepage.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Payment Example',
      theme: ThemeData(),
      home: const MyHomePage(title: 'Payment Example'),
    );
  }
}
