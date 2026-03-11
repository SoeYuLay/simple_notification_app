import 'package:flutter/material.dart';
import 'package:simple_notification_app/presentation/pages/notification_page.dart';
import 'package:simple_notification_app/core/theme/theme_const.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeConst.getTheme(),
      home: NotificationPage()
    );
  }
}
