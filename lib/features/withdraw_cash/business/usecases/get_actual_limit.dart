import 'package:bankamatik/core/errors/failure.dart';
import 'package:bankamatik/features/withdraw_cash/business/entities/limits.dart';
import 'package:dartz/dartz.dart';

import '../repositories/withdraw_cash_repository.dart';

class GetActualLimit {
  final WithdrawCashRepository repository;

  GetActualLimit(this.repository);
  Future<Either<Failure, Limits>> call() async {
    return await repository.getActualLimit();
  }
}
