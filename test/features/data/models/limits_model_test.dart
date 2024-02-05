import 'dart:convert';

import 'package:bankamatik/features/withdraw_cash/business/entities/limits.dart';
import 'package:bankamatik/features/withdraw_cash/data/models/limits_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  const tLimitsModel =
      LimitsModel(limits: {5000: 1, 2000: 1, 1000: 1, 500: 1, 200: 1, 100: 1});
  test('should be a subclass of Limits entity', () async {
    expect(tLimitsModel, isA<Limits>());
  });
  group('fromJson', () {
    test('should return a valid model when the JSON is Map <int,int>',
        () async {
      // arrange
      final Map<String, dynamic> jsonMap = json.decode(fixture('limit.json'));
      // act
      final result = LimitsModel.fromJson(jsonMap);
      // assert
      expect(result, tLimitsModel);
    });
  });
  group('toJson', () {
    test('should return a JSON map containing proper data', () async {
      // act
      final result = tLimitsModel.toJson();
      // assert
      final expectedMap = {
        "5000": 1,
        "2000": 1,
        "1000": 1,
        "500": 1,
        "200": 1,
        "100": 1
      };
      expect(result, expectedMap);
    });
  });
}
