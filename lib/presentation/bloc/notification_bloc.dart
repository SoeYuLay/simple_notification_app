import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_notification_app/data/repositories/notification_repo.dart';

import 'notification_event.dart';
import 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final NotificationRepo repository;

  NotificationBloc(this.repository) : super(NotificationInitialState()) {
    on<LoadNotifications>((event, emit) async {
      emit(NotificationLoadingState());
      try {
        final notifications = await repository.fetchNotifications();
        emit(NotificationLoadedState(notifications));
      } catch (e) {
        emit(NotificationError(e.toString()));
      }
    });

    // on<MarkNotificationAsRead>((event, emit) {
    //   if (state is NotificationLoadedState) {
    //     final currentState = state as NotificationLoadedState;

    //     final updatedList = currentState.notifications.map((noti) {
    //       if (noti.notiID == event.id) {
    //         return noti.copyWith(isRead: true);
    //       }
    //       return noti;
    //     }).toList();

    //     emit(NotificationLoadedState(updatedList));
    //   }
    // });

    //Mark as read/unread
    on<ToggleNotificationRead>((event, emit) {
    if (state is NotificationLoadedState) {
      final currentState = state as NotificationLoadedState;

      final updatedList = currentState.notifications.map((noti) {
        if (noti.notiID == event.id) {
          return noti.copyWith(isRead: !noti.isRead); 
        }
        return noti;
      }).toList();

      emit(NotificationLoadedState(updatedList));
    }
  });
  }
}


