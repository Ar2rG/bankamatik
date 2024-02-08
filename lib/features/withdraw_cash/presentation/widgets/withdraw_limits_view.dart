import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/withdraw_cash_bloc.dart';

class CustomLimitsView extends StatelessWidget {
  const CustomLimitsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WithdrawCashBloc, WithdrawCashState>(
        builder: (context, state) {
      if (state is Initial) {
        return const Text("");
      }
      if (state is Loading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is Loaded) {
        return Center(
          child: Text(state.limits.limits.toString()),
        );
      }
      if (state is Error) {
        return Center(child: Text(state.message));
      }
      return const SizedBox();
    });
  }
}
