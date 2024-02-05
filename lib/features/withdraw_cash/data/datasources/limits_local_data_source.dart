import '../models/limits_model.dart';

abstract class LimitsLocalDataSource {
  /// Gets the cached [LimitsModel] which was gotten the last time
  ///
  /// Throws [CacheException] if no cached data is present.
  Future<LimitsModel> getLastLimits();
  Future<void> cacheLimits(LimitsModel limitsToCache);
}
