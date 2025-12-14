import 'package:edemand_partner/analytics/google_analytics_service.dart';
import 'package:flutter/material.dart';

/// Route observer that automatically tracks screen views in Google Analytics.
class GoogleAnalyticsRouteObserver extends RouteObserver<PageRoute<dynamic>> {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    _trackScreenView(route);
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    if (newRoute != null) {
      _trackScreenView(newRoute);
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    if (previousRoute != null && previousRoute is PageRoute) {
      _trackScreenView(previousRoute);
    }
  }

  void _trackScreenView(Route<dynamic> route) {
    if (route is PageRoute) {
      final String? routeName = route.settings.name;
      if (routeName != null && routeName.isNotEmpty) {
        GoogleAnalyticsService.setCurrentScreen(screenName: routeName);
      }
    }
  }
}

/// Global instance of Google Analytics route observer.
final googleAnalyticsRouteObserver = GoogleAnalyticsRouteObserver();
