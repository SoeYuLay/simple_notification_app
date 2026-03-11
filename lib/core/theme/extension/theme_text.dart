import 'package:flutter/material.dart';

class NotiTextTheme extends ThemeExtension<NotiTextTheme> {
  final TextStyle title;
  final TextStyle subTitle;
  final TextStyle bodyRegular;
  final TextStyle bodySmall;

  const NotiTextTheme({
    required this.title,
    required this.subTitle,
    required this.bodyRegular,
    required this.bodySmall
  });
  @override
  ThemeExtension<NotiTextTheme> copyWith({
    TextStyle? title,
    TextStyle? subTitle,
    TextStyle? bodyRegular,
    TextStyle? bodySmall
  }) {
    return NotiTextTheme(
      title: title ?? this.title,
      subTitle: subTitle ?? this.subTitle,
      bodyRegular: bodyRegular ?? this.bodyRegular,
      bodySmall: bodySmall ?? this.bodySmall
    );
  }

  @override
  ThemeExtension<NotiTextTheme> lerp(
      covariant ThemeExtension<NotiTextTheme>? other, double t) {
    return NotiTextTheme(
      title: title,
      subTitle: subTitle,
      bodyRegular: bodyRegular,
      bodySmall: bodySmall
    );
  }
}