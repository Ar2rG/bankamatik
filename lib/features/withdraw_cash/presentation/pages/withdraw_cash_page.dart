import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import '../bloc/withdraw_cash_bloc.dart';
import '../widgets/actual_limits_container.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_bottom_bar.dart';
import '../widgets/custom_limits_view.dart';
import '../widgets/withdraw_controls.dart';

class WithdrawCashPage extends StatelessWidget {
  const WithdrawCashPage({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [BlocProvider(create: (_) => sl<WithdrawCashBloc>())],
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
