import 'package:bankamatik/core/util/input_converter.dart';
import 'package:bankamatik/features/withdraw_cash/business/usecases/get_actual_limit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../business/entities/limits.dart';
import '../../business/usecases/get_cash.dart';

part 'withdraw_cash_event.dart';
part 'withdraw_cash_state.dart';

class WithdrawCashBloc extends Bloc<WithdrawCashEvent, WithdrawCashState> {
  final GetCash getCash;
  final GetActualLimit getActualLimit;
  final InputConverter inputConverter;
  WithdrawCashBloc(
      {required this.getCash,
      required this.inputConverter,
      required this.getActualLimit})
      : super(Empty()) {
    on<GetCashEvent>((event, emit) async {
      emit(Loading());
      final inputEither =
          inputConverter.stringToUnsignedInt(event.numberString);
      inputEither.fold((failure) async {
        emit(const Error("Банкомат не может выдать запрашиваемую сумму"));
      }, (integer) async {
        final cashOrFailure = await getCash(desiredAmount: integer);
        cashOrFailure.fold(
            (failure) => emit(
                const Error("Банкомат не может выдать запрашиваемую сумму")),
            (limits) => Loaded(limits));
      });
    });
  }
}
