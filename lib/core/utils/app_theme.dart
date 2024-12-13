import 'package:flutter/material.dart';
import 'package:islamy/core/utils/app_color.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: AppColor.primarycolor,
    scaffoldBackgroundColor: AppColor.black,
    navigationBarTheme:
        const NavigationBarThemeData(backgroundColor: AppColor.primarycolor),
    appBarTheme: const AppBarTheme(
      color: AppColor.black,
      titleTextStyle: TextStyle(color: AppColor.primarycolor, fontSize: 22),
      centerTitle: true,
      iconTheme: IconThemeData(color: AppColor.primarycolor),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        iconSize: WidgetStateProperty.all(50),
        foregroundColor: WidgetStateProperty.all(AppColor.black)
      )
    )

  );
}
