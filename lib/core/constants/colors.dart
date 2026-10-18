import 'package:flutter/material.dart';

class AppColors {
  // Primary Backgrounds
  static const Color mainBackground = Color(0xFF080808);
  static const Color secondaryBackground = Color(0xFF111111);
  static const Color cardBackground = Color(0xFF151515);
  static const Color elevatedBackground = Color(0xFF1C1C1C);

  // Gold Accents & Palette
  static const Color primaryGold = Color(0xFFD4AF37);
  static const Color brightGold = Color(0xFFF3D37A);
  static const Color mutedGold = Color(0xFFA88736);
  static const Color goldBorder = Color(0xFF6B5428);

  // Text Colors
  static const Color primaryText = Color(0xFFF5F2EA);
  static const Color secondaryText = Color(0xFFA8A49B);
  static const Color mutedText = Color(0xFF6E6A63);

  // Trading Financial Indicators
  static const Color profitGreen = Color(0xFF27C982);
  static const Color lossRed = Color(0xFFF05A67);
  static const Color breakevenAmber = Color(0xFFE5A93C);

  // Subtle Borders and Dividers
  static const Color divider = Color(0xFF232323);
  static const Color inputBackground = Color(0xFF1A1A1A);
  static const Color inputBorder = Color(0xFF2A2A2A);

  // Gold Gradients
  static const LinearGradient goldGradient = LinearGradient(
    colors: [brightGold, primaryGold, mutedGold],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient goldHorizontalGradient = LinearGradient(
    colors: [brightGold, primaryGold],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const LinearGradient darkCardGradient = LinearGradient(
    colors: [Color(0xFF181818), Color(0xFF121212)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient profitGradient = LinearGradient(
    colors: [Color(0x3327C982), Color(0x0027C982)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
