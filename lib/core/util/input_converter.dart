import 'dart:convert';

import 'package:bankamatik/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

class InputConverter {
  Either<Failure, Map<int, int>> stringToMap(String str) {
    return Right(json.decode(str));
  }
}
