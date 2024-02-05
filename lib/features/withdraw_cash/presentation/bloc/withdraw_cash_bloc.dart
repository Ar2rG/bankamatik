import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'withdraw_cash_event.dart';
part 'withdraw_cash_state.dart';

class WithdrawCashBloc extends Bloc<WithdrawCashEvent, WithdrawCashState> {
  WithdrawCashBloc() : super(WithdrawCashInitial()) {
    on<WithdrawCashEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
