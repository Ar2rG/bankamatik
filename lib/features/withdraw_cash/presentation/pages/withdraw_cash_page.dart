import 'package:bankamatik/features/withdraw_cash/presentation/widgets/custom_app_bar.dart';
import 'package:bankamatik/features/withdraw_cash/presentation/widgets/custom_bottom_bar.dart';
import 'package:bankamatik/features/withdraw_cash/presentation/widgets/custom_limits_view.dart';
import 'package:flutter/material.dart';

class WithdrawCashPage extends StatelessWidget {
  const WithdrawCashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: const CustomLimitsView(),
      bottomNavigationBar: const CustomBottomBar(),
    );
  }
}
