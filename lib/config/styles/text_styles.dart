import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minimal/config/spacing.dart';
import 'package:minimal/config/styles/typography.dart';

import 'app_colors.dart';

class TextBody extends StatelessWidget {
  final String text;

  const TextBody({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: marginBottom24,
      child: Text(
        text,
        style: bodyTextStyle,
      ),
    );
  }
}

class TextBodySecondary extends StatelessWidget {
  final String text;

  const TextBodySecondary({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: marginBottom24,
      child: Text(
        text,
        style: subtitleTextStyle,
      ),
    );
  }
}

class TextHeadlineSecondary extends StatelessWidget {
  final String text;

  const TextHeadlineSecondary({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: marginBottom12,
      child: Text(
        text,
        style: headlineSecondaryTextStyle,
      ),
    );
  }
}

class TextBlockquote extends StatelessWidget {
  final String text;

  const TextBlockquote({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: marginBottom24,
      decoration: const BoxDecoration(
          border: Border(left: BorderSide(width: 2, color: Color(0xFF333333)))),
      padding: const EdgeInsets.only(left: 20),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: bodyTextStyle,
        ),
      ),
    );
  }
}

ButtonStyle? menuButtonStyle = TextButton.styleFrom(
    foregroundColor: Colors.white,
    backgroundColor: Colors.transparent,
    disabledForegroundColor: const Color.fromRGBO(
        0, 0, 0, 0.38), // Replace null with desired color and opacity
    textStyle: buttonTextStyle,
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16));

ButtonStyle? menuButtonStyleDarkMode = TextButton.styleFrom(
    foregroundColor: AppColors.textSecondary,
    backgroundColor: Colors.transparent,
    disabledForegroundColor: const Color.fromRGBO(
        0, 0, 0, 0.38), // Replace null with desired color and opacity
    textStyle: buttonTextStyleDarkMode,
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16));

////////////////////////////////////

class TextStyles {
  static TextStyle largeStyle(
      {Color color = AppColors.primaryColor, bool isBold = false}) {
    return TextStyle(
      color: color,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      fontFamily: 'Urbanist-Bold',
      fontSize: 120,
    );
  }

  static TextStyle large2Style(
      {Color color = AppColors.primaryColor, bool isBold = false}) {
    return TextStyle(
      color: color,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      fontFamily: 'Urbanist-Bold',
      fontSize: 70,
    );
  }

  static TextStyle titleStyle(
      {Color color = Colors.black, bool isBold = false}) {
    return TextStyle(
      color: color,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      fontFamily: 'Urbanist',
      fontSize: 30,
    );
  }

  static TextStyle title2Style(
      {Color color = Colors.black, bool isBold = false}) {
    return TextStyle(
      color: color,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      fontFamily: 'Urbanist',
      fontSize: 28,
    );
  }

  static TextStyle subTitleStyle(
      {Color color = Colors.black, bool isBold = false}) {
    return TextStyle(
      color: color,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      fontFamily: 'Urbanist',
      fontSize: 20,
    );
  }

  static TextStyle subTitles2tyle(
      {Color color = Colors.black, bool isBold = false}) {
    return TextStyle(
      color: color,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      fontFamily: 'CanvaSans',
      fontSize: 20,
    );
  }

  static TextStyle bodyStyle(
      {Color color = Colors.black, bool isBold = false}) {
    return TextStyle(
      color: color,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      fontFamily: 'Urbanist',
      fontSize: 18,
    );
  }

  static TextStyle body2Style(
      {Color color = Colors.black, bool isBold = false}) {
    return TextStyle(
      color: color,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      fontFamily: 'Urbanist',
      fontSize: 16,
    );
  }

  static TextStyle body3Style(
      {Color color = Colors.black, bool isBold = false}) {
    return TextStyle(
      color: color,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      fontFamily: 'CanvaSans',
      fontSize: 18,
    );
  }

  static TextStyle errorStyle(
      {Color color = Colors.orange, bool isBold = true}) {
    return TextStyle(
      color: color,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      fontFamily: 'Urbanist',
      fontSize: 14,
    );
  }

  static TextStyle captionStyle(
      {Color color = Colors.black, bool isBold = false}) {
    return TextStyle(
      color: color,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      fontFamily: 'CanvaSans',
      fontSize: 14,
    );
  }

  static TextStyle headlineTextStyle(
      {Color color = Colors.black, bool isBold = false}) {
    TextStyle textStyle = GoogleFonts.montserrat(
        textStyle: TextStyle(
      fontSize: 22,
      color: color,
      letterSpacing: 1.5,
      fontWeight: FontWeight.w300,
    ));

    return textStyle;
  }

  static TextStyle headlineSecondaryTextStyle(
      {Color color = Colors.black, bool isBold = false, double fontSize = 20}) {
    TextStyle textStyle = GoogleFonts.montserrat(
        textStyle: TextStyle(
      fontSize: fontSize,
      color: color,
      letterSpacing: 1.5,
      fontWeight: FontWeight.w300,
    ));

    return textStyle;
  }

  static TextStyle headlineSecondaryEmoji(
      {Color color = Colors.black, bool isBold = false, double fontSize = 20}) {
    TextStyle textStyle = GoogleFonts.notoColorEmoji(
        textStyle: TextStyle(
      fontSize: fontSize,
      color: color,
      // letterSpacing: 1.5,
      fontWeight: FontWeight.w300,
    ));

    return textStyle;
  }

  static TextStyle titleTextStyle(
      {Color color = Colors.black, bool isBold = false}) {
    TextStyle textStyleWhite = GoogleFonts.montserrat(
        textStyle: TextStyle(
      fontSize: 26,
      color: color,
      letterSpacing: 1.5,
      fontWeight: FontWeight.w300,
    ));

    return textStyleWhite;
  }

  static TextStyle bodyUnderLineStyle(
      {Color color = Colors.black, bool isBold = false}) {
    return TextStyle(
      decoration: TextDecoration.underline,
      color: color,
      decorationColor: color,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      fontFamily: 'Urbanist',
      decorationThickness: 3.0,
      fontSize: 16,
    );
  }

  static TextStyle bodyUnderLineS2tyle(
      {Color color = Colors.black, bool isBold = false}) {
    return TextStyle(
      decoration: TextDecoration.underline,
      color: color,
      decorationColor: color,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      fontFamily: 'CanvaSans',
      decorationThickness: 3.0,
      fontSize: 14.5,
    );
  }
}
