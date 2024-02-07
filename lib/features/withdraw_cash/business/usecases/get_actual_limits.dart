import '../../../../core/errors/failure.dart';
import '../entities/limits.dart';
import 'package:dartz/dartz.dart';

import '../repositories/withdraw_cash_repository.dart';

class GetCash {
  final WithdrawCashRepository repository;

  GetCash(this.repository);
  Future<Either<Failure, Limits>> call() async {
    return await repository.getActualLimits();
  }
}
