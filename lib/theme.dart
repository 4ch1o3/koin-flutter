import 'package:flutter/material.dart';

TextTheme koinTextTheme(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;
  const designWidth = 375.0;
  final scale = screenWidth / designWidth;

  double scaledSize(double size) => size;
  double scaledLetterSpacing(double fontSize, double percentage) =>
      fontSize * percentage;

  return TextTheme(
    displayLarge: TextStyle(
      fontFamily: "GapyeongHanseokbong",
      fontWeight: FontWeight.w700,
      fontSize: 48,
      letterSpacing: scaledLetterSpacing(48, -0.02),
    ),
    displayMedium: TextStyle(
      fontFamily: "Pretendard",
      fontWeight: FontWeight.w700,
      fontSize: 32,
      letterSpacing: scaledLetterSpacing(32, -0.02),
    ),
    displaySmall: TextStyle(
      fontFamily: "GapyeongHanseokbong",
      fontWeight: FontWeight.w700,
      fontSize: 24,
      letterSpacing: scaledLetterSpacing(24, -0.05),
    ),
    headlineLarge: TextStyle(
      fontFamily: "Pretendard",
      fontWeight: FontWeight.w500,
      fontSize: scaledSize(24),
      letterSpacing: scaledLetterSpacing(24, -0.02),
    ),
    headlineMedium: TextStyle(
      fontFamily: "GapyeongHanseokbong",
      fontWeight: FontWeight.w400,
      fontSize: scaledSize(20),
      letterSpacing: scaledLetterSpacing(20, -0.02),
    ),
    headlineSmall: TextStyle(
      fontFamily: "Pretendard",
      fontWeight: FontWeight.w600,
      fontSize: scaledSize(20),
      letterSpacing: scaledLetterSpacing(20, -0.02),
    ),
    titleLarge: TextStyle(
      fontFamily: "Pretendard",
      fontWeight: FontWeight.w700,
      fontSize: scaledSize(16),
      letterSpacing: scaledLetterSpacing(16, -0.02),
    ),
    titleMedium: TextStyle(
      fontFamily: "GapyeongHanseokbong",
      fontWeight: FontWeight.w700,
      fontSize: scaledSize(14),
      letterSpacing: scaledLetterSpacing(14, -0.02),
    ),
    titleSmall: TextStyle(
      fontFamily: "Pretendard",
      fontWeight: FontWeight.w600,
      fontSize: scaledSize(14),
      letterSpacing: scaledLetterSpacing(14, -0.02),
    ),
    bodyLarge: TextStyle(
      fontFamily: "Pretendard",
      fontWeight: FontWeight.w400,
      fontSize: scaledSize(16),
      letterSpacing: scaledLetterSpacing(16, -0.02),
    ),
    bodyMedium: TextStyle(
      fontFamily: "Pretendard",
      fontWeight: FontWeight.w500,
      fontSize: scaledSize(14),
      letterSpacing: scaledLetterSpacing(14, -0.02),
    ),
    bodySmall: TextStyle(
      fontFamily: "Pretendard",
      fontWeight: FontWeight.w400,
      fontSize: scaledSize(11),
      letterSpacing: 0,
    ),
    labelLarge: TextStyle(
      fontFamily: "Pretendard",
      fontWeight: FontWeight.w500,
      fontSize: scaledSize(12),
      letterSpacing: scaledLetterSpacing(12, -0.02),
    ),
    labelMedium: TextStyle(
      fontFamily: "Pretendard",
      fontWeight: FontWeight.w700,
      fontSize: scaledSize(10),
      letterSpacing: scaledLetterSpacing(10, -0.02),
    ),
    labelSmall: TextStyle(
      fontFamily: "Pretendard",
      fontWeight: FontWeight.w400,
      fontSize: scaledSize(8),
      letterSpacing: scaledLetterSpacing(8, 0.05),
    ),
  );
}
