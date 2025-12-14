/// Canonical list of Microsoft Clarity action identifiers used across the app.
///
/// Keep this file in sync with product/analytics requirements so every
/// developer can reuse the same action names.
///
/// When logging events, pass relevant parameters using the [parameters] map.
/// Common parameters:
/// - id: Entity ID (service_id, provider_id, booking_id, etc.)
/// - name: Entity name (service_name, provider_name, etc.)
/// - price: Price value
/// - status: Status value
/// - payment_method: Payment method used
/// - promo_code: Promo code name
/// - discount: Discount amount
class ClarityActions {
  const ClarityActions._();

  /// App-wide
  static const String appLaunch = 'app_launch';
  static const String appResume = 'app_resume';
  static const String appBackground = 'app_moved_to_background';

  /// Authentication
  static const String loginAttempt = 'login_attempt';
  static const String loginSuccess = 'login_success';
  static const String loginFailure = 'login_failure';
  static const String logout = 'logout';
  static const String registrationAttempt = 'registration_attempt';
  static const String registrationCompleted = 'registration_completed';
  static const String passwordChanged = 'password_changed';
  static const String deleteAccount = 'delete_account';

  /// Home & Navigation
  static const String bannerTapped = 'banner_tapped';
  static const String providerTapped = 'provider_tapped';
  static const String serviceTapped = 'service_tapped';
  static const String categoryTapped = 'category_tapped';

  /// Services Management
  static const String serviceCreated = 'service_created';
  static const String serviceUpdated = 'service_updated';
  static const String serviceDeleted = 'service_deleted';
  static const String serviceViewed = 'service_viewed';

  /// Bookings
  static const String bookingAccepted = 'booking_accepted';
  static const String bookingRejected = 'booking_rejected';
  static const String bookingCancelled = 'booking_cancelled';
  static const String bookingCompleted = 'booking_completed';
  static const String bookingStatusUpdated = 'booking_status_updated';
  static const String checkoutCompleted = 'checkout_completed';

  /// Promo Codes
  static const String promocodeCreated = 'promocode_created';
  static const String promocodeUpdated = 'promocode_updated';
  static const String promocodeDeleted = 'promocode_deleted';
  static const String promocodeApplied = 'promocode_applied';

  /// Payments & Subscriptions
  static const String subscriptionPurchase = 'subscription_purchase';
  static const String subscriptionRenewed = 'subscription_renewed';
  static const String subscriptionCancelled = 'subscription_cancelled';
  static const String payoutRequested = 'payout_requested';
  static const String withdrawalRequestSent = 'withdrawal_request_sent';
  static const String cashCollectionCompleted = 'cash_collection_completed';

  /// Reviews & Ratings
  static const String reviewSubmitted = 'review_submitted';
  static const String reviewViewed = 'review_viewed';

  /// Chat & Communication
  static const String chatMessageSent = 'chat_message_sent';
  static const String chatStarted = 'chat_started';
  static const String userBlocked = 'user_blocked';
  static const String userUnblocked = 'user_unblocked';
  static const String userReported = 'user_reported';

  /// Profile & Settings
  static const String profileUpdated = 'profile_updated';
  static const String settingsChanged = 'settings_changed';
  static const String contactUsSubmitted = 'contact_us_submitted';
  static const String languageChanged = 'language_changed';

  /// Job Requests
  static const String customJobApplied = 'custom_job_applied';
  static const String jobRequestViewed = 'job_request_viewed';
}
