
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:simple_notification_app/data/model/notification_model.dart';

part 'notification_api.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com/")
abstract class NotificationApi {
  factory NotificationApi(Dio dio, {String baseUrl}) = _NotificationApi;

  @GET("posts")
  Future<List<NotificationModel>> getNotifications();
}