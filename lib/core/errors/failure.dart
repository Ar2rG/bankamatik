abstract class Failure {
  final String errorMessage;
  const Failure({required this.errorMessage});
}

class WithdrawCashFailure extends Failure {
  WithdrawCashFailure({required String errorMessage})
      : super(errorMessage: errorMessage);
}

class CacheFailure extends Failure {
  CacheFailure({required super.errorMessage});
}
