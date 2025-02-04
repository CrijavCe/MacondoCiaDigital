import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minimal/config/styles/app_colors.dart';

// Simple
TextStyle headlineTextStyle = GoogleFonts.montserrat(
    textStyle: const TextStyle(
        fontSize: 26,
        color: AppColors.textPrimary,
        letterSpacing: 1.5,
        fontWeight: FontWeight.w300));

TextStyle headlineSecondaryTextStyle = GoogleFonts.montserrat(
    textStyle: const TextStyle(
        fontSize: 20,
        color: AppColors.textPrimary,
        fontWeight: FontWeight.w300));

TextStyle subtitleTextStyle = GoogleFonts.openSans(
    textStyle: const TextStyle(
        fontSize: 14, color: AppColors.textSecondary, letterSpacing: 1));

TextStyle bodyTextStyle = GoogleFonts.openSans(
    textStyle: const TextStyle(fontSize: 14, color: AppColors.textPrimary));

TextStyle buttonTextStyle = GoogleFonts.montserrat(
    textStyle: const TextStyle(
        fontSize: 14, color: AppColors.textPrimary, letterSpacing: 1));

// Advanced
// TODO: Add additional text styles.
