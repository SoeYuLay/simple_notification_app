import 'package:flutter/material.dart';
import 'package:simple_notification_app/core/theme/extension/theme_colors.dart';
import 'package:simple_notification_app/core/theme/extension/theme_text.dart';

class ThemeConst {
  static ThemeData getTheme(){
    return ThemeData(
      // fontFamily: 'Roboto',
      colorScheme: ThemeData.light().colorScheme.copyWith(
       primary: Color(0xFFE3F9FF),
        secondary: Color(0xFFFFFFFF),
        error: Color(0xFFFF161A),
      ),
      
      extensions: [NotiColors(textPrimary: Color(0xFF000000),datePrimary: Colors.grey ),
      NotiTextTheme(
        title: TextStyle(fontFamily: 'Roboto',fontSize:  30 , fontWeight:  FontWeight.w700), 
        subTitle: TextStyle(fontFamily: 'Roboto',fontSize:  20 , fontWeight:  FontWeight.bold) ,
        bodyRegular: TextStyle(fontFamily: 'Roboto',fontSize: 15), 
        bodySmall: TextStyle(fontFamily: 'Roboto',fontSize: 11,fontWeight: FontWeight.w500)
        )
      ],

    );
  }
}