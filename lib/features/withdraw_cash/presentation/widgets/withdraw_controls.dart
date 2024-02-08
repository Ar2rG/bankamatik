import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/withdraw_cash_bloc.dart';

class WithdrawControls extends StatefulWidget {
  const WithdrawControls({super.key});

  @override
  State<WithdrawControls> createState() => _WithdrawControlsState();
}

class _WithdrawControlsState extends State<WithdrawControls> {
  String inputString = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          decoration: InputDecoration(hintText: "Сумма в рублях"),
          keyboardType: TextInputType.number,
          // controller: desiredAmount,
          onChanged: (value) => setState(() => inputString = value),
        ),
        OutlinedButton(
            onPressed: () {
              context.read<WithdrawCashBloc>().add(GetCashEvent(inputString));
            },
            child: const Text('Выдать сумму'))
      ],
    );
  }
}
