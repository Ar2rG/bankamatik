part of 'withdraw_cash_bloc.dart';

sealed class WithdrawCashState extends Equatable {
  const WithdrawCashState();
  
  @override
  List<Object> get props => [];
}

final class WithdrawCashInitial extends WithdrawCashState {}
