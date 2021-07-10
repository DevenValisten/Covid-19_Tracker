import 'package:flutter/material.dart';

import '../constant.dart';

class MyTheme {
  ThemeData lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: kLightScaffoldColor,
    cardColor: Colors.white,
    canvasColor: Colors.transparent,
    textTheme: TextTheme(
      bodyText1: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 16,
        color: Colors.black,
      ),
      headline5: TextStyle(
        color: Colors.black,
      ),
      bodyText2: TextStyle(
        color: Colors.grey[800],
      ),
    ),
  );

  ThemeData darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Colors.black,
    cardColor: Color(0xff202020),
    canvasColor: Colors.transparent,
    textTheme: TextTheme(
      bodyText1: TextStyle(
        color: Color(0xffE6AD00),
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
      bodyText2: TextStyle(
        color: Color(0xffD9D9D9),
      ),
      headline5: TextStyle(
        color: Color(0xffE6AD00),
      ),
    ),
    // textTheme: TextTheme(

    //   bodyText2: TextStyle(
    //     color: Color(0xffD6D6D6),
    //     fontSize: 15,
    //   ),
    // ),
  );
}
