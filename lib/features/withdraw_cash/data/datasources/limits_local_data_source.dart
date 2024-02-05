import 'dart:convert';

import 'package:bankamatik/core/errors/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/limits_model.dart';

abstract class LimitsLocalDataSource {
  Future<LimitsModel> getLimits();
  // Future<void> cacheLimits(LimitsModel limitsToCache);
}

class LimitsLocalDataSourceImpl implements LimitsLocalDataSource {
  final SharedPreferences sharedPreferences;

  LimitsLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<LimitsModel> getLimits() {
    final jsonString = sharedPreferences.getString("limits");
    if (jsonString != null) {
      // Вот тут зашить логику выдачи денежек

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
