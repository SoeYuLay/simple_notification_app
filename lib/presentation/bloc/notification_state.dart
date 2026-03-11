import 'package:equatable/equatable.dart';
import 'package:simple_notification_app/data/model/notification_model.dart';

abstract class NotificationState extends Equatable{
    @override
  List<Object> get props => [];
}

class NotificationInitialState extends NotificationState{}

class NotificationLoadingState extends NotificationState{}

class NotificationLoadedState extends NotificationState{
  final List<NotificationModel> notifications;

  NotificationLoadedState(this.notifications);
  
    @override
  List<Object> get props => [notifications];
}

class NotificationError extends NotificationState {
  final String message;

  NotificationError(this.message);

  @override
  List<Object> get props => [message];
}