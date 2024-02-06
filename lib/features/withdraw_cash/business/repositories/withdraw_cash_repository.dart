import '../../../../core/errors/failure.dart';
import '../entities/limits.dart';
import 'package:dartz/dartz.dart';

abstract class WithdrawCashRepository {
  Future<Either<Failure, Limits>> getCash(int desiredAmount);
  Future<Either<Failure, Limits>> getActualLimit();
}
