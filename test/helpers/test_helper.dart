import 'package:bankamatik/features/withdraw_cash/business/repositories/withdraw_cash_repository.dart';
import 'package:bankamatik/features/withdraw_cash/data/datasources/limits_local_data_source.dart';
import 'package:bankamatik/features/withdraw_cash/data/repositories/withdraw_cash_repository_impl.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks(
    [WithdrawCashRepository, WithdrawCashRepositoryImpl, LimitsLocalDataSource])
void main() {}
