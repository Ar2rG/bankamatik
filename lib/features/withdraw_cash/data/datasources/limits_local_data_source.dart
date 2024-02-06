import 'dart:convert';

import 'package:bankamatik/core/errors/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/limits_model.dart';

abstract class LimitsLocalDataSource {
  Future<LimitsModel> getLimits(int desiredAmount);
}

class LimitsLocalDataSourceImpl implements LimitsLocalDataSource {
  final SharedPreferences sharedPreferences;

  LimitsLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<LimitsModel> getLimits(int desiredAmount) {
    final jsonString = sharedPreferences.getString("limits");
    if (jsonString != null) {
      try {
        // Выдача купюр от большего к меньшему
        Map<int, int> availableBanknotes = json.decode(jsonString);
        Map<int, int> result = {};
        for (var banknote in availableBanknotes.keys.toList()) {
          int count = desiredAmount ~/ banknote;
          if (count > 0) {
            if (availableBanknotes[banknote]! >= count) {
              result[banknote] = count;
              desiredAmount -= count * banknote;
            } else {
              result[banknote] = availableBanknotes[banknote]!;
              desiredAmount -= availableBanknotes[banknote]! * banknote;
            }
          }
        }
        if (desiredAmount == 0) {
          return Future.value(LimitsModel.fromJson(json.decode('$result')));
        } else {
          throw Exception();
        }
      } on Exception {
        throw CacheException();
      }
    } else {
      throw CacheException();
    }
  }
}
