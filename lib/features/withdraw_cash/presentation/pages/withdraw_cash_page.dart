import 'package:bankamatik/features/withdraw_cash/presentation/widgets/custom_top_clippers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import '../bloc/actual_limits_bloc.dart';
import '../bloc/withdraw_cash_bloc.dart';
import '../widgets/actual_limits_container.dart';
import '../widgets/custom_bottom_clippers.dart';
import '../widgets/withdraw_limits_view.dart';
import '../widgets/withdraw_controls.dart';

class WithdrawCashPage extends StatelessWidget {
  const WithdrawCashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          // Разделил на два отдельных блока, для возможного последущего
          // обновления остатка лимитов
          BlocProvider(create: (_) => sl<WithdrawCashBloc>()),
          BlocProvider(create: (_) => sl<ActualLimitsBloc>()),
        ],
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'ATM',
              style: TextStyle(color: Colors.white),
            ),
            toolbarHeight: MediaQuery.of(context).size.height * 0.08,
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                Color.fromRGBO(56, 39, 180, 1),
                Color.fromRGBO(108, 24, 164, 1),
              ])),
            ),
          ),
          body: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.35,
                child: const Stack(children: [
                  AllTopClippers(),
                  WithdrawControls(),
                ]),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
                child: const Placeholder(),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.17,
                child: Placeholder(),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
                child: const Placeholder(),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.17,
                child: Placeholder(),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
                child: const Placeholder(),
              ),
              Expanded(
                child: AllBottomClippers(),
              ),
            ],
          ),
        ));
  }
}
