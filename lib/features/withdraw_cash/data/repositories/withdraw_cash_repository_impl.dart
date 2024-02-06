import 'package:bankamatik/features/withdraw_cash/data/datasources/limits_local_data_source.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../business/repositories/withdraw_cash_repository.dart';
import 'package:dartz/dartz.dart';

import '../../business/entities/limits.dart';

class WithdrawCashRepositoryImpl implements WithdrawCashRepository {
  final LimitsLocalDataSource localDataSource;

  WithdrawCashRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, Limits>> getCash(int desiredAmount) async {
    try {
      final localLimits = await localDataSource.getLimits();
      return Right(localLimits);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, Limits>> getActualLimit() async {
    try {
      final localLimits = await localDataSource.getLimits();
      return Right(localLimits);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
