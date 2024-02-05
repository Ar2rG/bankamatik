import 'package:bankamatik/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

class InputConverter {
  Either<Failure, int> stringToUnsignedInt(String str) {
    try {
      final integer = int.parse(str);
      if (integer < 100 || integer % 2 == 0) {
        throw FormatException();
      }
      return Right(integer);
    } on FormatException {
      return Left(InvalidInputFailure(
          errorMessage: "Ошибка преобразования строки или неверное число"));
    }
  }
}

class InvalidInputFailure extends Failure {
  InvalidInputFailure({required super.errorMessage});
}
