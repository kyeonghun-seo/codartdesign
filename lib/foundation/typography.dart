part of '../codartdesign.dart';

/// Headings
const titleXXL = TextStyle(fontFamily: 'NotoSans', fontSize: 48, fontWeight: FontWeight.w600, letterSpacing: -1.5);
const titleXL = TextStyle(fontFamily: 'NotoSans', fontSize: 24, fontWeight: FontWeight.w600, letterSpacing: -1.0);

/// Headings, List Item Title, Sub Title
const titleL = TextStyle(fontFamily: 'NotoSans', fontSize: 23, fontWeight: FontWeight.w600, letterSpacing: -0.5);
const titleM = TextStyle(fontFamily: 'NotoSans', fontSize: 19, fontWeight: FontWeight.w600, letterSpacing: -0.25);
const titleS = TextStyle(fontFamily: 'NotoSans', fontSize: 16, fontWeight: FontWeight.w500, letterSpacing: -0.25);
const titleXS = TextStyle(fontFamily: 'NotoSans', fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: -0.15);

/// Body, Button Label
const textL = TextStyle(fontFamily: 'NotoSans', fontSize: 16, fontWeight: FontWeight.w500, letterSpacing: -0.25);

/// Body, Button Label, Sub Text, Caption, Overline, Badge
const textM = TextStyle(fontFamily: 'NotoSans', fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: -0.25);
const textS = TextStyle(fontFamily: 'NotoSans', fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: -0.15);
const textXS = TextStyle(fontFamily: 'NotoSans', fontSize: 11, fontWeight: FontWeight.w400, letterSpacing: -0.15);

class CodartTypography {
  CodartTypography._();

  static final CodartTypography _instance = CodartTypography._();

  factory CodartTypography() => _instance;
}
