/// Central registry for analytics and tracking identifiers used in the app.
///
/// Update [microsoftClarityProjectId] with the ID provided by
/// the Microsoft Clarity dashboard before releasing to production builds.
class AnalyticsIds {
  const AnalyticsIds._();

  /// Microsoft Clarity project identifier.
  ///
  /// Example value: `"abcd123456"`.
  static const String microsoftClarityProjectId = 'PLACE_YOUR_PROJECT_ID';
}
