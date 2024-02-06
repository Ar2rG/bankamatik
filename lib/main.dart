import 'package:bankamatik/features/withdraw_cash/presentation/bloc/withdraw_cash_bloc.dart';
import 'package:bankamatik/features/withdraw_cash/presentation/pages/withdraw_cash_page.dart';
import 'package:bankamatik/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:bankamatik/injection_container.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [BlocProvider(create: (_) => sl<WithdrawCashBloc>())],
        child: MaterialApp(
            title: 'Bankamatik',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const SafeArea(
              child: WithdrawCashPage(),
            )));
  }
}
