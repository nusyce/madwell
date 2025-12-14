import 'package:edemand_partner/analytics/clarity_service.dart';
import 'package:edemand_partner/analytics/google_analytics_service.dart';

/// Helper class to log events to both Microsoft Clarity and Google Analytics.
///
/// This ensures consistency across both analytics platforms.
class AnalyticsHelper {
  const AnalyticsHelper._();

  /// Logs an event to both Clarity and Google Analytics.
  ///
  /// [action] should be one of the ClarityActions constants.
  /// [parameters] is an optional map of key-value pairs.
  static Future<void> logEvent(
    String action, {
    Map<String, String>? parameters,
  }) async {
    // Log to Microsoft Clarity
    ClarityService.logAction(action, parameters: parameters);

    // Log to Google Analytics
    // Convert Map<String, String> to Map<String, Object> for Google Analytics
    final Map<String, Object>? gaParams = parameters?.map(
      (key, value) => MapEntry(key, value as Object),
    );
    await GoogleAnalyticsService.logEvent(action, parameters: gaParams);
  }

  /// Sets user ID for both analytics platforms.
  static Future<void> setUserId(String userId) async {
    ClarityService.setUserId(userId);
    await GoogleAnalyticsService.setUserId(userId);
  }

  /// Sets user property for Google Analytics.
  /// Note: Clarity uses tags, which are set automatically with events.
  static Future<void> setUserProperty({
    required String name,
    required String? value,
  }) async {
    await GoogleAnalyticsService.setUserProperty(name: name, value: value);
  }

  /// Sets a tag/property for both analytics platforms.
  static void setTag(String key, String value) {
    ClarityService.setTag(key, value);
    GoogleAnalyticsService.setUserProperty(name: key, value: value);
  }
}
