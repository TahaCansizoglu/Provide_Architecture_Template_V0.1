import 'package:flutter/material.dart';

class ColorConstants {
  static ColorConstants _instance = ColorConstants._init();
  static ColorConstants get instance => ColorConstants._instance;
  Color textColor = Color.fromRGBO(65, 75, 90, 1);
  Color bgColor = Color.fromRGBO(236, 239, 244, 1);
  Color kScaffoldBackgroundColor = Color(0xffE5E5E5);
  Color kGradientTextColorOne = Color(0xffDA1CC7);
  Color kGradientTextColorTwo = Color(0xff3FD7EC);
  Color kCheckBoxTextColor = Color.fromRGBO(65, 75, 90, 1);
  ColorConstants._init();
}
