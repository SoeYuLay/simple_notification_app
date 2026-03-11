import 'package:flutter/material.dart';

@immutable
class NotiColors extends ThemeExtension<NotiColors> {
  final Color? textPrimary;
  final Color? datePrimary;

  const NotiColors({
    required this.textPrimary,
    required this.datePrimary
  });

  @override
  NotiColors copyWith({Color? textPrimary, Color? datePrimary}) {
    return NotiColors(
      textPrimary: textPrimary ?? this.textPrimary,
      datePrimary: datePrimary ?? this.datePrimary
    );
  }

  @override
  NotiColors lerp(ThemeExtension<NotiColors>? other, double t) {
    if (other is! NotiColors) return this;
    return NotiColors(
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t),
      datePrimary: Color.lerp(datePrimary, other.datePrimary, t)
    );
  }
}