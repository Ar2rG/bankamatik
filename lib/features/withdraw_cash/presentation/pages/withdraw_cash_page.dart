import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/custom_app_bar.dart';
import '../widgets/custom_bottom_bar.dart';
import '../widgets/custom_limits_view.dart';
import '../widgets/withdraw_controls.dart';
import 'package:flutter/material.dart';

class WithdrawCashPage extends StatefulWidget {
  const WithdrawCashPage({super.key});

  @override
  State<WithdrawCashPage> createState() => _WithdrawCashPageState();
}

class _WithdrawCashPageState extends State<WithdrawCashPage> {
  @override
  void initState() {
    _initField();
    super.initState();
  }

  _initField() async {
    SharedPreferences addLimits = await SharedPreferences.getInstance();
    addLimits.setString("limits",
        "{'5000': 10, '2000': 100, '1000': 10, '500': 5, '200': 100, '100': 50}");
  }

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
