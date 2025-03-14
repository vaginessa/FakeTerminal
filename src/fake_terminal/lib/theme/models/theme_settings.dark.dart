part of 'theme_settings.dart';

ThemeData _createDarkTheme(double fontSizeBody) {
  final baseTheme = ThemeData.dark();
  final primaryColor = Color(0xFF242424);
  final lightPrimaryColor = Color(0xff424242);
  final accentColor = Color(0xff1e90ff);
  final accentTextColor = Color(0xff72d5a3);
  final textColor = Colors.white;

  return baseTheme.copyWith(
    colorScheme: baseTheme.colorScheme.copyWith(
      background: primaryColor,
      primary: primaryColor,
      secondary: accentColor,
      onSecondary: accentTextColor,
    ),
    scaffoldBackgroundColor: primaryColor,
    backgroundColor: primaryColor,
    cardColor: lightPrimaryColor,
    buttonTheme: baseTheme.buttonTheme.copyWith(highlightColor: accentColor),
    highlightColor: accentColor,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: textColor,
      selectionColor: accentColor,
      selectionHandleColor: accentColor,
    ),
    floatingActionButtonTheme: baseTheme.floatingActionButtonTheme.copyWith(
      backgroundColor: accentColor,
      foregroundColor: Colors.white,
    ),
    textTheme: baseTheme.textTheme
        .copyWith(
          bodyText1: baseTheme.textTheme.bodyText1?.copyWith(fontSize: fontSizeBody, fontFamily: 'FiraCode'),
          bodyText2: baseTheme.textTheme.bodyText2
              ?.copyWith(fontSize: fontSizeBody, fontWeight: FontWeight.bold, fontFamily: 'FiraCode'),
          subtitle1: baseTheme.textTheme.subtitle1?.copyWith(fontSize: 17, fontWeight: FontWeight.bold),
          subtitle2: baseTheme.textTheme.subtitle1?.copyWith(fontSize: 17, fontWeight: FontWeight.normal),
          headline1: baseTheme.textTheme.bodyText1?.copyWith(fontSize: fontSizeBody, fontFamily: 'FiraCode'),
          headline2: baseTheme.textTheme.bodyText2
              ?.copyWith(fontSize: fontSizeBody, fontWeight: FontWeight.bold, fontFamily: 'FiraCode'),
        )
        .apply(bodyColor: textColor),
  );
}
