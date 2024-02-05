part of 'withdraw_cash_bloc.dart';

sealed class WithdrawCashEvent extends Equatable {
  const WithdrawCashEvent();

  @override
  List<Object> get props => [];
}

class GetCash extends WithdrawCashEvent {
  final String mapOfIntString;

  const GetCash(
    this.mapOfIntString,
  );
}
