import 'package:clarity_flutter/clarity_flutter.dart';
import 'package:flutter/foundation.dart';

import 'google_analytics_service.dart';

/// Thin wrapper around the Microsoft Clarity SDK.
class ClarityService {
  const ClarityService._();

  /// Sends a custom action/event to Clarity.
  static void logAction(
    String action, [
    Map<String, Object?>? parameters,
  ]) {
    final trimmed = action.trim();
    if (trimmed.isEmpty) return;

    GoogleAnalyticsService.logEvent(trimmed, parameters: parameters);

    try {
      Clarity.sendCustomEvent(trimmed);
    } catch (error, stackTrace) {
      _debugPrint('logAction', error, stackTrace);
    }
  }

  /// Associates the current session with a user identifier.
  static void setUserId(String userId) {
    final trimmed = userId.trim();
    if (trimmed.isEmpty) return;

    GoogleAnalyticsService.setUserId(trimmed);

    try {
      Clarity.setCustomUserId(trimmed);
    } catch (error, stackTrace) {
      _debugPrint('setUserId', error, stackTrace);
    }
  }

  /// Adds a custom tag to the current session.
  static void setTag(String key, String value) {
    final trimmedKey = key.trim();
    final trimmedValue = value.trim();
    if (trimmedKey.isEmpty || trimmedValue.isEmpty) return;

    GoogleAnalyticsService.setUserProperty(trimmedKey, trimmedValue);

    try {
      Clarity.setCustomTag(trimmedKey, trimmedValue);
    } catch (error, stackTrace) {
      _debugPrint('setTag', error, stackTrace);
    }
  }

  /// Updates the screen name in Clarity (treated as a new page by Clarity).
  static void setScreenName(String name) {
    final trimmed = name.trim();
    if (trimmed.isEmpty) return;

    GoogleAnalyticsService.logScreenView(trimmed);

    try {
      Clarity.setCurrentScreenName(trimmed);
    } catch (error, stackTrace) {
      _debugPrint('setScreenName', error, stackTrace);
    }
  }

  /// Returns the URL of the current Clarity session recording if available.
  static String? get currentSessionUrl {
    try {
      return Clarity.getCurrentSessionUrl();
    } catch (error, stackTrace) {
      _debugPrint('currentSessionUrl', error, stackTrace);
      return null;
    }
  }

  static void _debugPrint(
    String method,
    Object error,
    StackTrace stackTrace,
  ) {
    if (kDebugMode) {
      debugPrint(
        '[ClarityService] $method failed: $error\n$stackTrace',
      );
    }
  }
}
