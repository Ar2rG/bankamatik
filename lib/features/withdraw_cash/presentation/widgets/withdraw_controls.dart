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
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextField(
          textAlign: TextAlign.center,
          decoration: const InputDecoration(
              hintText: "Сумма в рублях",
              suffix: Text(
                '.00 руб',
                style: TextStyle(color: Colors.white),
              )),
          keyboardType: TextInputType.number,
          style: const TextStyle(color: Colors.white),
          onChanged: (value) => setState(() => inputString = value),
        ),
        OutlinedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateColor.resolveWith(
              (states) => const Color.fromRGBO(230, 30, 173, 1),
            )),
            onPressed: () {
              context.read<WithdrawCashBloc>().add(GetCashEvent(inputString));
            },
            child: const Text('Выдать сумму',
                style: TextStyle(color: Colors.white)))
      ],
    );
  }
}
