import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class NotificationEvent extends Equatable{
  @override
  List<Object> get props => [];
}

class LoadNotifications extends NotificationEvent{}

// class MarkNotificationAsRead extends NotificationEvent {
//   final int id;

//   MarkNotificationAsRead(this.id);
// }

class ToggleNotificationRead extends NotificationEvent {
  final int id;

  ToggleNotificationRead(this.id);
}
