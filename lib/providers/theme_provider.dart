import 'package:flutter/material.dart';
import 'package:four_pics_one_word/services/storage_util.dart';

class ThemeProvider with ChangeNotifier {
  late ThemeData themeData;

  ThemeProvider() {
    themeData =
        themeFromStorage == 0 ? classicTheme() : themeData = darkTheme();
  }

  int get themeFromStorage => StorageUtil.getInt('theme');

  void changeTheme() {
    if (themeFromStorage == 0) {
      StorageUtil.putInt('theme', 1);
      themeData = darkTheme();
    } else {
      StorageUtil.putInt('theme', 0);
      themeData = classicTheme();
    }
    notifyListeners();
  }

  ThemeData darkTheme() => ThemeData(
        buttonColor: Color(0xFF333333),
        scaffoldBackgroundColor: Color(0xFF3D3D3D),
        primaryColor: Color(0xFF2D2D2D),
        accentColor: Color(0xFF2D2D2D),
        backgroundColor: Color(0xFF2D2D2D),
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 24.0,
            color: Color(0xFFE0E0E0).withOpacity(0.9),
            fontFamily: 'RobotoSlab',
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
          ),
          headline2: TextStyle(
            fontSize: 24.0,
            color: Color(0xFFE0E0E0),
            fontFamily: 'RobotoSlab',
          ),
          headline3: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
            fontWeight: FontWeight.w300,
          ),
          bodyText1: TextStyle(
            fontSize: 14.0,
            color: Color(0xFFE0E0E0),
            fontWeight: FontWeight.w500,
            fontFamily: 'RobotoSlab',
          ),
          bodyText2: TextStyle(
            fontSize: 18.0,
            color: Color(0xFFE0E0E0),
            fontWeight: FontWeight.bold,
          ),
        ),
      );

  ThemeData classicTheme() => ThemeData(
        buttonColor: Color(0xFF99DDC8),
        scaffoldBackgroundColor: Color(0xFF283F3B),
        primaryColor: Color(0xFF99DDC8),
        accentColor: Color(0xFFC4C4C4),
        backgroundColor: Color(0xFF283F3B),
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 24.0,
            color: Color(0xFF283F3B).withOpacity(0.9),
            fontFamily: 'RobotoSlab',
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
          ),
          headline2: TextStyle(
            fontSize: 24.0,
            color: Colors.white,
            fontFamily: 'RobotoSlab',
          ),
          headline3: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
            fontWeight: FontWeight.w300,
          ),
          bodyText1: TextStyle(
            fontSize: 14.0,
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontFamily: 'RobotoSlab',
          ),
          bodyText2: TextStyle(
            fontSize: 18.0,
            color: Color(0xFF283F3B),
            fontWeight: FontWeight.bold,
          ),
        ),
      );
}
