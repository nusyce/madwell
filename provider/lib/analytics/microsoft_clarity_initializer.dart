import 'dart:io' show Platform;

import 'package:clarity_flutter/clarity_flutter.dart';
import 'package:edemand_partner/analytics/clarity_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Wraps the application with `ClarityWidget` when a valid project ID is set
/// and the current platform supports Microsoft Clarity (Android/iOS).
class MicrosoftClarityInitializer extends StatefulWidget {
  const MicrosoftClarityInitializer({
    super.key,
    required this.projectId,
    required this.child,
  });

  final String projectId;
  final Widget child;

  @override
  State<MicrosoftClarityInitializer> createState() =>
      _MicrosoftClarityInitializerState();
}

class _MicrosoftClarityInitializerState
    extends State<MicrosoftClarityInitializer> {
  @override
  void initState() {
    super.initState();
    // Mark Clarity as initialized after the first frame is rendered
    // Add a small delay to ensure ClarityWidget is fully initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 100), () {
        if (mounted) {
          ClarityService.markInitialized();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final trimmedId = widget.projectId.trim();
    if (trimmedId.isEmpty || kIsWeb || !_isMobilePlatform) {
      // Even if Clarity isn't used, mark as initialized to prevent blocking
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Future.delayed(const Duration(milliseconds: 50), () {
          if (mounted) {
            ClarityService.markInitialized();
          }
        });
      });
      return widget.child;
    }

    return ClarityWidget(
      clarityConfig: ClarityConfig(projectId: trimmedId),
      app: widget.child,
    );
  }

  bool get _isMobilePlatform {
    try {
      return Platform.isAndroid || Platform.isIOS;
    } catch (_) {
      return false;
    }
  }
}
