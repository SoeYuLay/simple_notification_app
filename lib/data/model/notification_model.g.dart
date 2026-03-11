// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) =>
    NotificationModel(
      notiID: (json['id'] as num).toInt(),
      notiTitle: json['title'] as String,
      notiContent: json['body'] as String,
      isRead: false
    );

Map<String, dynamic> _$NotificationModelToJson(NotificationModel instance) =>
    <String, dynamic>{
      'id': instance.notiID,
      'title': instance.notiTitle,
      'body': instance.notiContent,
    };
