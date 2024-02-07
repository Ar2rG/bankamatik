import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import '../bloc/actual_limits_bloc.dart';
import '../bloc/withdraw_cash_bloc.dart';
import '../widgets/actual_limits_container.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_bottom_bar.dart';
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
          appBar: CustomAppBar(),
          body: const Column(
            children: [
              WithdrawControls(),
              CustomLimitsView(),
              ActualLimitsContainer(),
            ],
          ),
          bottomNavigationBar: const CustomBottomBar(),
        ));
  }
}
