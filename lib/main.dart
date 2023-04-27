import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_example/services/service_locator.dart';
import 'package:flutter_riverpod_example/view/passenger_view.dart';

void main() async {
  await registerServices();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Riverpod',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PassengerView(),
    );
  }
}
