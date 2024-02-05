import 'package:bankamatik/core/util/input_converter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../business/entities/limits.dart';
import '../../business/usecases/get_cash.dart';

part 'withdraw_cash_event.dart';
part 'withdraw_cash_state.dart';

class WithdrawCashBloc extends Bloc<WithdrawCashEvent, WithdrawCashState> {
  final GetCash _getCash;
  final InputConverter _inputConverter;
  WithdrawCashBloc(this._getCash, this._inputConverter)
      : super(WithdrawCashInitial()) {
    on<GetCashEvent>((event, emit) {
      emit(Loading());
      final inputEither =
          _inputConverter.stringToUnsignedInt(event.numberString);
      inputEither.fold((failure) async {
        emit(Error("Упс"));
      }, (integer) async {
        final cashOrFailure = await _getCash.exexute(desiredAmount: integer);
        cashOrFailure.fold(
            (failure) => emit(Error("Упс")), (limits) => Loaded(limits));
      });
    });
  }
}
