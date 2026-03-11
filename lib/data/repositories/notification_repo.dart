import 'package:simple_notification_app/data/model/notification_model.dart';
import 'package:simple_notification_app/data/data_source/notification_api.dart';

class NotificationRepo {
  NotificationRepo(this.notiApi);

  final NotificationApi notiApi;

  Future<List<NotificationModel>> fetchNotifications() async {
    try{
      return await notiApi.getNotifications();
    }catch (e) {
      throw Exception("Failed to fetch notifications");
    }
  }

}
