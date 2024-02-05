import 'package:bankamatik/core/errors/exceptions.dart';
import 'package:bankamatik/core/errors/failure.dart';
import 'package:bankamatik/features/withdraw_cash/data/models/limits_model.dart';
import 'package:bankamatik/features/withdraw_cash/data/repositories/withdraw_cash_repository_impl.dart';
// import 'package:bankamatik/features/withdraw_cash/data/repositories/withdraw_cash_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  late WithdrawCashRepositoryImpl repository;
  late MockLimitsLocalDataSource mockLocalDataSource;

  setUp(() {
    mockLocalDataSource = MockLimitsLocalDataSource();
    repository =
        WithdrawCashRepositoryImpl(localDataSource: mockLocalDataSource);
  });

  const tLimitsModel =
      LimitsModel(limits: {5000: 1, 2000: 1, 1000: 1, 500: 1, 200: 1, 100: 1});
  const tDesiredAmount = 10000;
  group('Тесты локального хранилища', () {
    test(
      'Должен вернуть последнюю сохранённую информацию',
      () async {
        // arrange
        when(mockLocalDataSource.getLastLimits())
            .thenAnswer((_) async => tLimitsModel);
        // act
        final result = await repository.getCash(tDesiredAmount);
        // assert
        verify(mockLocalDataSource.getLastLimits());
        expect(result, const Right(tDesiredAmount));
      },
    );
    test(
      'Должен возвращать CacheFailure, когда нет кэшированных данных',
      () async {
        // arrange
        when(mockLocalDataSource.getLastLimits()).thenThrow(CacheException());
        // act
        final result = await repository.getCash(tDesiredAmount);
        // assert
        verify(mockLocalDataSource.getLastLimits());
        expect(result,
            equals(Left(CacheFailure(errorMessage: 'Ошибка: Нет наличных'))));
      },
    );
  });
}
