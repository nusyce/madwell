import 'package:flutter/material.dart';

import 'clarity_service.dart';

/// Observes navigation changes and reports them to Microsoft Clarity.
class ClarityRouteObserver extends RouteObserver<PageRoute<dynamic>> {
  void _sendScreenView(Route<dynamic>? route) {
    if (route is PageRoute<dynamic>) {
      final name = route.settings.name ?? route.runtimeType.toString();
      ClarityService.setScreenName(name);
    }
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    _sendScreenView(route);
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    _sendScreenView(newRoute);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    _sendScreenView(previousRoute);
  }
}

final clarityRouteObserver = ClarityRouteObserver();
