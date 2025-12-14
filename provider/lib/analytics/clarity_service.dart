import 'package:clarity_flutter/clarity_flutter.dart';
import 'package:flutter/foundation.dart';

/// Thin wrapper around the Microsoft Clarity SDK.
class ClarityService {
  const ClarityService._();

  static bool _isInitialized = false;

  /// Marks Clarity as initialized. Should be called after ClarityWidget is built.
  static void markInitialized() {
    _isInitialized = true;
  }

  /// Checks if Clarity is ready to receive events.
  static bool get isReady => _isInitialized;

  /// Sends a custom action/event to Clarity.
  ///
  /// [parameters] is an optional map of key-value pairs to attach as tags.
  /// Each parameter will be set as a custom tag before sending the event.
  static void logAction(String action, {Map<String, String>? parameters}) {
    final trimmed = action.trim();
    if (trimmed.isEmpty || !_isInitialized) return;

    try {
      // Set parameters as tags before sending the event
      if (parameters != null) {
        for (final entry in parameters.entries) {
          final key = entry.key.trim();
          final value = entry.value.trim();
          if (key.isNotEmpty && value.isNotEmpty) {
            try {
              Clarity.setCustomTag(key, value);
            } catch (e) {
              // Silently ignore tag setting errors
              _debugPrint('setCustomTag', e, StackTrace.current);
            }
          }
        }
      }

      Clarity.sendCustomEvent(trimmed);
    } catch (error, stackTrace) {
      // Suppress FormatException errors from SDK's internal timestamp parsing
      if (error is! FormatException) {
        _debugPrint('logAction', error, stackTrace);
      }
    }
  }

  /// Associates the current session with a user identifier.
  static void setUserId(String userId) {
    final trimmed = userId.trim();
    if (trimmed.isEmpty || !_isInitialized) return;

    try {
      Clarity.setCustomUserId(trimmed);
    } catch (error, stackTrace) {
      // Suppress FormatException errors from SDK's internal timestamp parsing
      if (error is! FormatException) {
        _debugPrint('setUserId', error, stackTrace);
      }
    }
  }

  /// Adds a custom tag to the current session.
  static void setTag(String key, String value) {
    final trimmedKey = key.trim();
    final trimmedValue = value.trim();
    if (trimmedKey.isEmpty || trimmedValue.isEmpty || !_isInitialized) return;

    try {
      Clarity.setCustomTag(trimmedKey, trimmedValue);
    } catch (error, stackTrace) {
      // Suppress FormatException errors from SDK's internal timestamp parsing
      if (error is! FormatException) {
        _debugPrint('setTag', error, stackTrace);
      }
    }
  }

  /// Updates the screen name in Clarity (treated as a new page by Clarity).
  static void setScreenName(String name) {
    final trimmed = name.trim();
    if (trimmed.isEmpty || !_isInitialized) return;

    try {
      Clarity.setCurrentScreenName(trimmed);
    } catch (error, stackTrace) {
      // Suppress FormatException errors from SDK's internal timestamp parsing
      if (error is! FormatException) {
        _debugPrint('setScreenName', error, stackTrace);
      }
    }
  }

  /// Returns the URL of the current Clarity session recording if available.
  static String? get currentSessionUrl {
    if (!_isInitialized) return null;
    try {
      return Clarity.getCurrentSessionUrl();
    } catch (error, stackTrace) {
      // Suppress FormatException errors from SDK's internal timestamp parsing
      if (error is! FormatException) {
        _debugPrint('currentSessionUrl', error, stackTrace);
      }
      return null;
    }
  }

  static void _debugPrint(String method, Object error, StackTrace stackTrace) {
    if (kDebugMode) {
      debugPrint('[ClarityService] $method failed: $error\n$stackTrace');
    }
  }
}
