import 'package:bankamatik/features/withdraw_cash/presentation/pages/withdraw_cash_page.dart';
import 'package:flutter/material.dart';
import 'package:bankamatik/injection_container.dart' as di;

void main() async {
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Где-то здесь нужны провайдеры
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const WithdrawCashPage(),
    );
  }
}
