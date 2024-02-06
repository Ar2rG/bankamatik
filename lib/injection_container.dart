import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/util/input_converter.dart';
import 'features/withdraw_cash/business/repositories/withdraw_cash_repository.dart';
import 'features/withdraw_cash/business/usecases/get_cash.dart';
import 'features/withdraw_cash/data/datasources/limits_local_data_source.dart';
import 'features/withdraw_cash/data/repositories/withdraw_cash_repository_impl.dart';
import 'features/withdraw_cash/presentation/bloc/withdraw_cash_bloc.dart';

final locator = GetIt.instance;

Future<void> init() async {
//! Feature - Withdraw Cash
// Bloc
  locator.registerFactory(() => WithdrawCashBloc(
        getCash: locator(),
        inputConverter: locator(),
      ));
// Use cases
  locator.registerLazySingleton(() => GetCash(locator()));
// Repositories
  locator.registerLazySingleton<WithdrawCashRepository>(
      () => WithdrawCashRepositoryImpl(localDataSource: locator()));
// Data sources
  locator.registerLazySingleton<LimitsLocalDataSource>(
      () => LimitsLocalDataSourceImpl(sharedPreferences: locator()));

//! Core
  locator.registerLazySingleton(() => InputConverter());

//! External
  final sharedPreferences = await SharedPreferences.getInstance();
  locator.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
}
