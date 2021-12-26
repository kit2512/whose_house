import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static const kPrimaryColor = Color(0xff299274);
  static const kPrimaryLightColor = Color(0xffF2F2F2);
  static ThemeData light() {
    return ThemeData(
      colorScheme: ColorScheme.light(primary: kPrimaryColor),
      primaryColor: kPrimaryColor,
      brightness: Brightness.light,
      fontFamily: "Manrope",
      textTheme: TextTheme(
        headline1: TextStyle(
          color: kPrimaryColor,
          fontSize: 95.sp,
          fontWeight: FontWeight.w300,
        ),
        headline2: TextStyle(
          color: kPrimaryColor,
          fontSize: 59.sp,
          fontWeight: FontWeight.w300,
        ),
        headline3: TextStyle(
          color: kPrimaryColor,
          fontSize: 48.sp,
          fontWeight: FontWeight.w400,
        ),
        headline4: TextStyle(
          color: kPrimaryColor,
          fontSize: 34.sp,
          fontWeight: FontWeight.w400,
        ),
        headline5: TextStyle(
          color: kPrimaryColor,
          fontSize: 24.sp,
          fontWeight: FontWeight.w400,
        ),
        headline6: TextStyle(
          color: kPrimaryColor,
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
        ),
        subtitle1: TextStyle(
          color: kPrimaryColor,
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
        ),
        subtitle2: TextStyle(
          color: kPrimaryColor,
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
        ),
        bodyText1: TextStyle(
          color: kPrimaryColor,
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
        ),
        bodyText2: TextStyle(
          color: kPrimaryColor,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        button: TextStyle(
          color: kPrimaryColor,
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
        ),
        caption: TextStyle(
          color: kPrimaryColor,
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
        ),
        overline: TextStyle(
          color: kPrimaryColor,
          fontSize: 10.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: kPrimaryColor,
          padding: EdgeInsets.symmetric(
            vertical: 15.h,
            horizontal: 16.w,
          ),
          textStyle: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
          ),
          elevation: 0,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.sp),
          ),
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: kPrimaryColor,
        ),
        centerTitle: true,
      ),
      scaffoldBackgroundColor: Colors.white,
      inputDecorationTheme: InputDecorationTheme(
        prefixIconColor: kPrimaryColor,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.sp),
          borderSide: BorderSide(
            color: kPrimaryColor,
            width: 2.sp,
          ),
        ),
        hintStyle: const TextStyle(color: Color(0xffA2A0A8)),
        suffixIconColor: const Color(0xffa2a0a8),
        focusColor: kPrimaryColor,
        filled: true,
        fillColor: kPrimaryLightColor,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(16.sp),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 17.h),
      ),
      checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateProperty.all<Color>(kPrimaryColor),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1.sp,
              color: kPrimaryColor,
            ),
            borderRadius: BorderRadius.circular(4.sp),
          )),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: kPrimaryColor,
        contentTextStyle: const TextStyle(color: Colors.white),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.sp),
        ),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
