import 'package:flutter/material.dart';
import 'package:simple_notification_app/core/theme/extension/theme_colors.dart';
import 'package:simple_notification_app/core/theme/extension/theme_text.dart';


extension ThemeGetter on BuildContext {

  NotiColors get colors => Theme.of(this).extension<NotiColors>()!;

  NotiTextTheme get notiText => Theme.of(this).extension<NotiTextTheme>()!;
}