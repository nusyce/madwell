import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';

/// Thin wrapper around Firebase Analytics (Google Analytics).
class GoogleAnalyticsService {
  const GoogleAnalyticsService._();

  static final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  /// Sends a custom event to Google Analytics.
  ///
  /// [eventName] should match the event names defined in analytics_events.dart.
  /// [parameters] is an optional map of key-value pairs to attach to the event.
  /// Parameter names should be lowercase and use underscores (snake_case).
  static Future<void> logEvent(
    String eventName, {
    Map<String, Object>? parameters,
  }) async {
    final trimmed = eventName.trim();
    if (trimmed.isEmpty) return;

    try {
      // Convert string parameters to Object for Firebase Analytics
      final Map<String, Object> analyticsParams = {};
      if (parameters != null) {
        for (final entry in parameters.entries) {
          final key = entry.key.trim();
          final value = entry.value;
          if (key.isNotEmpty) {
            // Firebase Analytics requires String, int, or double values
            if (value is String) {
              if (value.isNotEmpty) {
                analyticsParams[key] = value;
              }
            } else if (value is num) {
              analyticsParams[key] = value;
            } else {
              analyticsParams[key] = value.toString();
            }
          }
        }
      }

      await _analytics.logEvent(
        name: trimmed,
        parameters: analyticsParams.isEmpty ? null : analyticsParams,
      );
    } catch (error, stackTrace) {
      _debugPrint('logEvent', error, stackTrace);
    }
  }

  /// Sets the user ID for Google Analytics.
  static Future<void> setUserId(String userId) async {
    final trimmed = userId.trim();
    if (trimmed.isEmpty) return;

    try {
      await _analytics.setUserId(id: trimmed);
    } catch (error, stackTrace) {
      _debugPrint('setUserId', error, stackTrace);
    }
  }

  /// Sets a user property in Google Analytics.
  static Future<void> setUserProperty({
    required String name,
    required String? value,
  }) async {
    final trimmedName = name.trim();
    final trimmedValue = value?.trim();
    if (trimmedName.isEmpty) return;

    try {
      await _analytics.setUserProperty(name: trimmedName, value: trimmedValue);
    } catch (error, stackTrace) {
      _debugPrint('setUserProperty', error, stackTrace);
    }
  }

  /// Sets the current screen name in Google Analytics.
  static Future<void> setCurrentScreen({
    required String screenName,
    String? screenClass,
  }) async {
    final trimmed = screenName.trim();
    if (trimmed.isEmpty) return;

    try {
      await _analytics.logScreenView(
        screenName: trimmed,
        screenClass: screenClass ?? trimmed,
      );
    } catch (error, stackTrace) {
      _debugPrint('setCurrentScreen', error, stackTrace);
    }
  }

  /// Logs a custom event with parameters converted from Map<String, String> to Map<String, Object>.
  /// This is a convenience method that matches ClarityService.logAction signature.
  static Future<void> logAction(
    String action, {
    Map<String, String>? parameters,
  }) async {
    final Map<String, Object>? analyticsParams = parameters?.map(
      (key, value) => MapEntry(key, value as Object),
    );

    await logEvent(action, parameters: analyticsParams);
  }

  static void _debugPrint(String method, Object error, StackTrace stackTrace) {
    if (kDebugMode) {
      debugPrint(
        '[GoogleAnalyticsService] $method failed: $error\n$stackTrace',
      );
    }
  }
}
