import 'dart:convert';

import 'package:bankamatik/core/errors/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/limits_model.dart';

abstract class LimitsLocalDataSource {
  Future<LimitsModel> getLimits();
  Future<LimitsModel> getActualLimit();
}

class LimitsLocalDataSourceImpl implements LimitsLocalDataSource {
  final SharedPreferences sharedPreferences;

  LimitsLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<LimitsModel> getLimits() {
    final jsonString = sharedPreferences.getString("limits");
    if (jsonString != null) {
      // Вот тут зашить логику списания с баланса
      // После изменить сумму в локальном хранилище и вызвать отображение актуального состояния

      return Future.value(LimitsModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  Future<LimitsModel> getActualLimit() {
    final jsonString = sharedPreferences.getString("limits");
    if (jsonString != null) {
      return Future.value(LimitsModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  // @override
  // Future<void> cacheLimits(LimitsModel limitsToCache) {
  //   return sharedPreferences.setString(
  //     "limits",
  //     json.encode(limitsToCache),
  //   );
  // }
}
