import 'package:bankamatik/features/withdraw_cash/presentation/bloc/actual_limits_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActualLimitsContainer extends StatefulWidget {
  const ActualLimitsContainer({super.key});

  @override
  State<ActualLimitsContainer> createState() => _ActualLimitsContainerState();
}

class _ActualLimitsContainerState extends State<ActualLimitsContainer> {
  @override
  void initState() {
    context.read<ActualLimitsBloc>().add(const GetActualLimitsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActualLimitsBloc, ActualLimitsState>(
        builder: (context, state) {
      if (state is Initial) {
        return const Text("Initial");
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
      return const SizedBox();
    });
  }
}
