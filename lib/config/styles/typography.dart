import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minimal/config/styles/app_colors.dart';

// Simple
TextStyle headlineTextStyle = GoogleFonts.montserrat(
    textStyle: const TextStyle(
        fontSize: 24,
        color: AppColors.textPrimary,
        letterSpacing: 1.5,
        fontWeight: FontWeight.w300));
TextStyle headlineTextStyleEmoji = GoogleFonts.notoColorEmoji(
    textStyle: const TextStyle(
        fontSize: 25,
        color: AppColors.textPrimary,
        letterSpacing: 1.5,
        fontWeight: FontWeight.w300));

TextStyle statsTextStyle = GoogleFonts.montserrat(
    textStyle: const TextStyle(
        fontSize: 50,
        color: Colors.greenAccent,
        letterSpacing: 1.5,
        fontWeight: FontWeight.w500));

TextStyle headlineTextStyleWhite = GoogleFonts.montserrat(
    textStyle: const TextStyle(
  fontSize: 22,
  // color: Colors.white,
  color: AppColors.backgroundColor,
  letterSpacing: 1.5,
  fontWeight: FontWeight.bold,
));

TextStyle headlineTextStyleBlack = GoogleFonts.montserrat(
    textStyle: const TextStyle(
  fontSize: 22,
  color: Colors.black,
  letterSpacing: 1.5,
  fontWeight: FontWeight.w300,
));

TextStyle headlineSecondaryTextStyle = GoogleFonts.montserrat(
    textStyle: const TextStyle(
        fontSize: 20,
        color: AppColors.textPrimary,
        fontWeight: FontWeight.w300));

TextStyle headlineSecondaryTextStyleWhite = GoogleFonts.montserrat(
    textStyle: const TextStyle(
        fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold));

TextStyle subtitleTextStyle = GoogleFonts.openSans(
    textStyle: const TextStyle(
        fontSize: 14, color: AppColors.textSecondary, letterSpacing: 1));

TextStyle subtitleTextStyleWhite = GoogleFonts.openSans(
    textStyle:
        const TextStyle(fontSize: 14, color: Colors.white, letterSpacing: 1));

TextStyle bodyTextStyle = GoogleFonts.openSans(
    textStyle: const TextStyle(fontSize: 14, color: AppColors.textPrimary));

TextStyle buttonTextStyle = GoogleFonts.montserrat(
    textStyle: const TextStyle(
  fontSize: 14,
  color: AppColors.textPrimary,
  letterSpacing: 1,
));

TextStyle buttonTextStyleDarkMode = GoogleFonts.montserrat(
    textStyle: const TextStyle(
  fontSize: 14,
  color: Colors.white,
  letterSpacing: 1,
));

// Advanced
// TODO: Add additional text styles.
