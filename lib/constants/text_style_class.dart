import 'package:flutter/material.dart';
import 'package:graphql_sampl_application/constants/color_class.dart';

const String primaryFontName = 'DmSans';

class TextStyleClass {
  static const double textHeight = 1.4;
  static TextStyle regularwhiteTextStyle(double size, Color color) {
    return TextStyle(
      fontFamily: primaryFontName,
      fontWeight: FontWeight.w700,
      height: textHeight,
      color: color,
      fontSize: size,
    );
  }

  static TextStyle grayTextStyle() {
    return const TextStyle(
      fontFamily: primaryFontName,
      fontWeight: FontWeight.w400,
      height: textHeight,
      color: ColorClass.charcoalGray,
      fontSize: 14,
    );
  }

  static TextStyle whiteTextStyle() {
    return const TextStyle(
      fontFamily: primaryFontName,
      fontWeight: FontWeight.w500,
      height: textHeight,
      color: ColorClass.white,
      fontSize: 24,
    );
  }

  static TextStyle regWhiteTextStyle() {
    return const TextStyle(
      fontFamily: primaryFontName,
      fontWeight: FontWeight.w400,
      height: textHeight,
      color: ColorClass.white,
      fontSize: 10,
    );
  }

  static TextStyle blackTextStyle(Color color) {
    return TextStyle(
      fontFamily: primaryFontName,
      fontWeight: FontWeight.w400,
      height: textHeight,
      color: color,
      fontSize: 12,
    );
  }
}
