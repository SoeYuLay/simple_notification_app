import 'package:json_annotation/json_annotation.dart';

part 'notification_model.g.dart'; 

@JsonSerializable()
class NotificationModel {
  @JsonKey(name: "id")
  final int notiID;

  @JsonKey(name: "title")
  final String notiTitle;

  @JsonKey(name: "body")
  final String notiContent;

  final bool isRead;

  NotificationModel({
    required this.notiID,
    required this.notiTitle,
    required this.notiContent,
    this.isRead = false
  });

  NotificationModel copyWith({
    bool? isRead,
  }) {
    return NotificationModel(
      notiID: notiID,
      notiTitle: notiTitle,
      notiContent: notiContent,
      isRead: isRead ?? this.isRead,
    );
  }

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
          _$NotificationModelFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationModelToJson(this);
}
