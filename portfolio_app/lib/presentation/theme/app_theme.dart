import 'package:flutter/material.dart';

import 'colors.dart';

class AppTheme {
  static const double spacingSmall = 10.0;
  static const double spacing = 15.0;
  static const double spacingBig = 20.0;
  static const double formFieldSpacing = spacingBig;
  static const EdgeInsets containerPadding = EdgeInsets.symmetric(
    horizontal: spacingBig,
    vertical: 30.0,
  );
  static const EdgeInsets cardPadding = EdgeInsets.symmetric(
    horizontal: 20.0,
    vertical: 5.0,
  );

  static BorderRadiusGeometry containerBorderRadius =
      BorderRadius.circular(18.0);

  static ButtonStyle flatButtonStyle = TextButton.styleFrom(
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 16.0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2.0)),
    ),
  );

  static ThemeData themeData = ThemeData.light().copyWith(
    accentColor: AppColors.accentColor,
    buttonTheme: ButtonThemeData(
      height: 56.0,
      buttonColor: Color(0xFF4696CD),
      textTheme: ButtonTextTheme.primary,
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Color(0xFFF4F4F4),
      filled: true,
      hoverColor: Color(0xFFEAEAEA),
      focusColor: Colors.green,
    ),
    textTheme: TextTheme().copyWith(
      bodyText1: TextStyle().copyWith(color: AppColors.mainText),
      bodyText2: TextStyle().copyWith(color: AppColors.mainText),
      caption: TextStyle().copyWith(color: AppColors.mainText),
      button: TextStyle().copyWith(color: AppColors.mainText),
      headline1: TextStyle().copyWith(
        color: AppColors.mainText,
        fontSize: 30,
        fontWeight: FontWeight.w700,
      ),
      headline2: TextStyle().copyWith(
        color: AppColors.mainText,
        fontSize: 27,
        fontWeight: FontWeight.w700,
      ),
      headline3: TextStyle().copyWith(
        color: AppColors.mainText,
        fontSize: 24,
        fontWeight: FontWeight.w700,
      ),
      headline4: TextStyle().copyWith(
        color: AppColors.mainText,
        fontSize: 21,
        fontWeight: FontWeight.w700,
      ),
      headline5: TextStyle().copyWith(
        color: AppColors.mainText,
        fontSize: 17,
        fontWeight: FontWeight.w600,
      ),
      headline6: TextStyle().copyWith(
        color: AppColors.mainText,
        fontSize: 15,
        fontWeight: FontWeight.w600,
      ),
      // text style of inputs
      subtitle1: TextStyle().copyWith(color: AppColors.inputTextColor),
      subtitle2: TextStyle().copyWith(color: AppColors.mainText),
    ),
    primaryTextTheme: TextTheme().copyWith(
      bodyText1: TextStyle().copyWith(color: AppColors.secondaryText),
      bodyText2: TextStyle().copyWith(color: AppColors.secondaryText),
      caption: TextStyle().copyWith(color: AppColors.secondaryText),
      button: TextStyle().copyWith(color: AppColors.secondaryText),
      headline1: TextStyle().copyWith(color: AppColors.secondaryText),
      headline2: TextStyle().copyWith(color: AppColors.secondaryText),
      headline3: TextStyle().copyWith(color: AppColors.secondaryText),
      headline4: TextStyle().copyWith(color: AppColors.secondaryText),
      headline5: TextStyle().copyWith(color: AppColors.secondaryText),
      headline6: TextStyle().copyWith(color: AppColors.secondaryText),
      subtitle1: TextStyle().copyWith(color: AppColors.secondaryText),
      subtitle2: TextStyle().copyWith(color: AppColors.secondaryText),
    ),
    accentTextTheme: TextTheme().copyWith(
      bodyText1: TextStyle().copyWith(
        color: AppColors.secondaryText,
        fontWeight: FontWeight.bold,
        fontSize: 18.0,
      ),
      bodyText2: TextStyle().copyWith(color: AppColors.secondaryText),
      caption: TextStyle().copyWith(color: AppColors.secondaryText),
      button: TextStyle().copyWith(color: AppColors.secondaryText),
      headline1: TextStyle().copyWith(color: AppColors.secondaryText),
      headline2: TextStyle().copyWith(color: AppColors.secondaryText),
      headline3: TextStyle().copyWith(color: AppColors.secondaryText),
      headline4: TextStyle().copyWith(color: AppColors.secondaryText),
      headline5: TextStyle().copyWith(color: AppColors.secondaryText),
      headline6: TextStyle().copyWith(color: AppColors.secondaryText),
      subtitle1: TextStyle().copyWith(color: AppColors.secondaryText),
      subtitle2: TextStyle().copyWith(color: AppColors.secondaryText),
    ),
  );
}

class FormVerticalSpacer extends StatelessWidget {
  const FormVerticalSpacer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: AppTheme.formFieldSpacing);
  }
}
