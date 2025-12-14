import 'package:e_demand/app/generalImports.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({final Key? key}) : super(key: key);

  static Route route(final RouteSettings routeSettings) => CupertinoPageRoute(
        builder: (final _) => const NotificationScreen(),
      );

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final ScrollController _scrollController = ScrollController();

  void fetchNotifications() {
    context.read<NotificationsCubit>().fetchNotifications();
  }

  bool _shouldShowArrow(dynamic notification) {
    final String? notificationType = notification.type;
    if (notificationType == null) return false;

    final String lowerType = notificationType.toLowerCase();

    // Show arrow for all redirect notifications except general and personal
    // General notifications show error message, personal notifications only have delete action
    return lowerType != 'general' && lowerType != 'personal';
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero).then((final value) {
      fetchNotifications();
    });

    _scrollController.addListener(() {
      if (!context.read<NotificationsCubit>().hasMoreNotification()) {
        return;
      }
// nextPageTrigger will have a value equivalent to 70% of the list size.
      final nextPageTrigger = 0.7 * _scrollController.position.maxScrollExtent;

// _scrollController fetches the next paginated data when the current position of the user on the screen has surpassed
      if (_scrollController.position.pixels > nextPageTrigger) {
        if (mounted) {
          context.read<NotificationsCubit>().fetchMoreNotifications();
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Widget notificationShimmerLoadingContainer(
          {required final int noOfShimmerContainer}) =>
      SingleChildScrollView(
        child: Column(
          children: List.generate(
            noOfShimmerContainer,
            (final int index) => Padding(
              padding: const EdgeInsets.all(8),
              child: CustomShimmerLoadingContainer(
                borderRadius: UiUtils.borderRadiusOf10,
                width: context.screenWidth,
                height: 92,
              ),
            ),
          ).toList(),
        ),
      );

  @override
  Widget build(final BuildContext context) => InterstitialAdWidget(
        child: Scaffold(
          backgroundColor: context.colorScheme.primaryColor,
          appBar: UiUtils.getSimpleAppBar(
            context: context,
            title: 'notification'.translate(context: context),
          ),
          bottomNavigationBar: Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).padding.bottom),
              child: const BannerAdWidget()),
          body: BlocBuilder<NotificationsCubit, NotificationsState>(
            builder:
                (final BuildContext context, final NotificationsState state) {
              if (state is NotificationFetchFailure) {
                return ErrorContainer(
                  onTapRetry: () {
                    fetchNotifications();
                  },
                  errorMessage: state.errorMessage.translate(context: context),
                );
              }
              if (state is NotificationFetchSuccess) {
                return state.notificationsList.isEmpty
                    ? Center(
                        child: NoDataFoundWidget(
                          titleKey: 'noNotificationsFound'
                              .translate(context: context),
                          subtitleKey: 'noNotificationsFoundSubTitle'
                              .translate(context: context),
                        ),
                      )
                    : CustomRefreshIndicator(
                        displacment: 12,
                        onRefreshCallback: () {
                          fetchNotifications();
                        },
                        child: BlocProvider(
                          create: (context) => DeleteNotificationCubit(),
                          child: ListView.builder(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            controller: _scrollController,
                            shrinkWrap: true,
                            itemCount: state.notificationsList.length +
                                (state.isLoadingMoreData ? 1 : 0),
                            itemBuilder:
                                (final BuildContext context, final index) {
                              if (index >= state.notificationsList.length) {
                                return Center(
                                  child: notificationShimmerLoadingContainer(
                                      noOfShimmerContainer: 1),
                                );
                              }
                              final notification =
                                  state.notificationsList[index];
                              return CustomSlidableTileContainer(
                                showArrow: _shouldShowArrow(notification),
                                onSlideTap: () async {
                                  final String? notificationType =
                                      notification.type;

                                  // Only show general message if type is explicitly "general"
                                  if (notificationType != null &&
                                      notificationType.toLowerCase() ==
                                          'general') {
                                    UiUtils.showMessage(
                                      context,
                                      'thisIsGeneralNotification'
                                          .translate(context: context),
                                      ToastificationType.error,
                                    );
                                    return;
                                  }

                                  // Keep original validation for provider
                                  if (notificationType != null &&
                                      notificationType.toLowerCase() ==
                                          'provider') {
                                    if (notification.translatedProviderName
                                            .toString() ==
                                        '') {
                                      UiUtils.showMessage(
                                        context,
                                        'thisProviderIsNotAvailable'
                                            .translate(context: context),
                                        ToastificationType.error,
                                      );
                                      return;
                                    }
                                  }

                                  // Keep original validation for category/subcategory
                                  final String lowerType =
                                      notificationType?.toLowerCase() ?? '';

                                  // Convert notification model to data map for handleNotificationRedirection
                                  final Map<String, dynamic> notificationData =
                                      {
                                    'type': notificationType ?? '',
                                    'type_id': notification.typeId ?? '',
                                    'order_id': notification.orderId ?? '',
                                    'booking_id': notification.orderId ?? '',
                                    'provider_id': notification.typeId ?? '',
                                    'category_id': notification.typeId ?? '',
                                    'category_name':
                                        notification.translatedCategoryName ?? '',
                                    'url': notification.url ?? '',
                                    'body': notification.message ?? '',
                                    'title': notification.title ?? '',
                                    'custom_job_request_id':
                                        notification.typeId ?? '',
                                    'blog_id': notification.typeId ?? '',
                                    // Set parent_id for category/subcategory handling
                                    'parent_id': (lowerType == 'category')
                                        ? '0'
                                        : (lowerType == 'subcategory' ||
                                                lowerType.replaceAll(' ', '') ==
                                                    'subcategory')
                                            ? '1'
                                            : '',
                                  };

                                  // Handle notification redirection using the same logic as notificationService
                                  await NotificationService
                                      .handleNotificationRedirection(
                                    notificationData,
                                  );
                                },
                                isRead:
                                    notification.isRead == "1" ? true : false,
                                imageURL: notification.image.toString(),
                                title: notification.title.toString(),
                                subTitle: notification.message.toString(),
                                durationTitle: notification.duration.toString(),
                                dateSent: notification.dateSent.toString(),
                                tileBackgroundColor: notification.isRead == "1"
                                    ? context.colorScheme.primaryColor
                                    : context.colorScheme.secondaryColor,
                                slidableChild: notification.type != 'personal'
                                    ? null
                                    : BlocConsumer<DeleteNotificationCubit,
                                        DeleteNotificationsState>(
                                        listener: (final BuildContext context,
                                            final DeleteNotificationsState
                                                removeNotificationState) {
                                          if (removeNotificationState
                                              is DeleteNotificationSuccess) {
                                            UiUtils.showMessage(
                                              context,
                                              'notificationDeletedSuccessfully'
                                                  .translate(context: context),
                                              ToastificationType.success,
                                            );
                                            context
                                                .read<NotificationsCubit>()
                                                .removeNotificationFromList(
                                                  removeNotificationState
                                                      .notificationId,
                                                );
                                          } else if (removeNotificationState
                                              is DeleteNotificationFailure) {
                                            UiUtils.showMessage(
                                              context,
                                              removeNotificationState
                                                  .errorMessage,
                                              ToastificationType.error,
                                            );
                                          }
                                        },
                                        builder: (final BuildContext context,
                                            final DeleteNotificationsState
                                                removeNotificationState) {
                                          if (removeNotificationState
                                              is DeleteNotificationInProgress) {
                                            if (notification.id ==
                                                removeNotificationState
                                                    .notificationId) {
                                              return Center(
                                                child: CustomContainer(
                                                  color: Colors.transparent,
                                                  height: 20,
                                                  width: 20,
                                                  child:
                                                      CustomCircularProgressIndicator(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .secondaryColor,
                                                    strokeWidth: 2,
                                                  ),
                                                ),
                                              );
                                            }
                                          }

                                          return SlidableAction(
                                            backgroundColor: Colors.transparent,
                                            autoClose: false,
                                            onPressed: (final context) {
                                              context
                                                  .read<
                                                      DeleteNotificationCubit>()
                                                  .deleteNotification(
                                                    state
                                                        .notificationsList[
                                                            index]
                                                        .id
                                                        .toString(),
                                                  );
                                            },
                                            icon: Icons.delete,
                                            label: 'delete'
                                                .translate(context: context),
                                            borderRadius: BorderRadius.circular(
                                                UiUtils.borderRadiusOf10),
                                          );
                                        },
                                      ),
                              );
                            },
                          ),
                        ),
                      );
              }
              return notificationShimmerLoadingContainer(
                noOfShimmerContainer: UiUtils.numberOfShimmerContainer,
              );
            },
          ),
        ),
      );
}
