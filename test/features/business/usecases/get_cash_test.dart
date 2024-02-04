import 'package:bankamatik/features/withdraw_cash/business/entities/limits.dart';
import 'package:bankamatik/features/withdraw_cash/business/usecases/get_cash.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  late GetCash usecase;
  late MockWithdrawCashRepository mock;

  setUp(() {
    mock = MockWithdrawCashRepository();
    usecase = GetCash(mock);
  });

  const tDesiredAmount = 10000;
  const tLimits =
      Limits({5000: 10, 2000: 100, 1000: 10, 500: 5, 200: 100, 100: 50});
  test('get cash', () async {
    // arrange
    when(mock.getCash(any)).thenAnswer((_) async => const Right(tLimits));
    // act
    final result = await usecase.execute(desiredAmount: tDesiredAmount);
    // assert
    expect(result, Right(tLimits));
    verify(mock.getCash(tDesiredAmount));
    verifyNoMoreInteractions(mock);
  });
}
