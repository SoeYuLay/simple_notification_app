import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:simple_notification_app/data/data_source/notification_api.dart';
import 'package:simple_notification_app/core/theme/theme_getter.dart';
import 'package:simple_notification_app/data/repositories/notification_repo.dart';
import 'package:simple_notification_app/presentation/bloc/notification_bloc.dart';
import 'package:simple_notification_app/presentation/bloc/notification_event.dart';
import 'package:simple_notification_app/presentation/bloc/notification_state.dart';
import 'package:simple_notification_app/presentation/widget/notification_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    final customColors = context.colors;
    final customText = context.notiText;
    final dio = Dio(BaseOptions(headers: {"Accept": "application/json"}));
    final api = NotificationApi(dio);
    final repository = NotificationRepo(api);

    return BlocProvider(
      create: (_) => NotificationBloc(repository)..add(LoadNotifications()),
      child: Scaffold(
        backgroundColor: colorScheme.secondary,
        appBar: AppBar(
          backgroundColor: colorScheme.secondary,
          title: Text(
            'Notifications',
            style: customText.title.copyWith(color: customColors.textPrimary),
          ),
        ),
        body: SafeArea(
          child: BlocBuilder<NotificationBloc, NotificationState>(
            builder: (context, state) {
              if (state is NotificationLoadingState) {
                return Center(child: CircularProgressIndicator(color: customColors.textPrimary,));
              }

              if (state is NotificationLoadedState) {
                return RefreshIndicator(
                  color: customColors.textPrimary,
                  onRefresh: () async {
                    context.read<NotificationBloc>().add(LoadNotifications());
                  },
                  child: ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: state.notifications.length,
                    itemBuilder: (context, index) {
                      final notiDate = DateTime.now().subtract(Duration(days: index));
                      final formattedDate = DateFormat('yyyy-MM-dd').format(notiDate);
                      return NotificationCard(
                        notiData: state.notifications[index],
                        formattedDate: formattedDate,
                        onTap: () {
                          context.read<NotificationBloc>().add(
                            ToggleNotificationRead(
                              state.notifications[index].notiID,
                            ),
                          );
                          final isNowRead = state.notifications[index].isRead ? false : true;
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Row(
                                children: [
                                  Icon(
                                    isNowRead ? Icons.mark_email_read : Icons.mark_email_unread,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Text(
                                      isNowRead ? 'Notification marked as read' : 'Notification marked as unread',
                                      style: TextStyle(
                                        color: colorScheme.primary,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: isNowRead ? Colors.greenAccent : Colors.redAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              margin: const EdgeInsets.all(16),
                              duration: const Duration(seconds: 2),
                            ),
                          );
                        },
                      );
                    },
                  ),
                );
              }

              if (state is NotificationError) {
                return Center(child: Text("Error: ${state.message}"));
              }

              return const Center(
                child: Text("No Notifications are available"),
              );
            },
          ),
        ),
      ),
    );
  }
}
