import 'package:bankamatik/core/errors/failure.dart';
import 'package:bankamatik/features/withdraw_cash/business/entities/limits.dart';
import 'package:dartz/dartz.dart';

import '../repositories/withdraw_cash_repository.dart';

class GetCash {
  final WithdrawCashRepository repository;

  GetCash(this.repository);
  Future<Either<Failure, Limits>> execute({required int desiredAmount}) async {
    return await repository.getCash(desiredAmount);
  }
}
