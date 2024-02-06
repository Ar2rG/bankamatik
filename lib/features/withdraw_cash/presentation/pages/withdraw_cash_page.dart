import '../widgets/custom_app_bar.dart';
import '../widgets/custom_bottom_bar.dart';
import '../widgets/custom_limits_view.dart';
import '../widgets/withdraw_controls.dart';
import 'package:flutter/material.dart';

class WithdrawCashPage extends StatelessWidget {
  const WithdrawCashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: const Column(
        children: [
          CustomLimitsView(),
          WithdrawControls(),
        ],
      ),
      bottomNavigationBar: const CustomBottomBar(),
    );
  }
}
