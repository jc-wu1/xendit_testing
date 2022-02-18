import 'package:flutter/material.dart';
import 'package:xendit_testing/src/myapp.dart';
import 'package:xendit_testing/src/presentation/injector.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDependencies();

  runApp(const MyApp());
}
