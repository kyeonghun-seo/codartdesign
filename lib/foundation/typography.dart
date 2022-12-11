part of '../../codartdesign.dart';

/// Headings
const titleXXL = TextStyle(fontFamily: 'NotoSans', fontSize: 101, fontWeight: FontWeight.w600, letterSpacing: -1.5);
const titleXL = TextStyle(fontFamily: 'NotoSans', fontSize: 63, fontWeight: FontWeight.w600, letterSpacing: -1.0);

/// eadings, List Item Title, Sub Title
const titleL = TextStyle(fontFamily: 'NotoSans', fontSize: 50, fontWeight: FontWeight.w600, letterSpacing: -0.5);
const titleM = TextStyle(fontFamily: 'NotoSans', fontSize: 36, fontWeight: FontWeight.w600, letterSpacing: -0.25);
const titleS = TextStyle(fontFamily: 'NotoSans', fontSize: 25, fontWeight: FontWeight.w500, letterSpacing: -0.25);
const titleXS = TextStyle(fontFamily: 'NotoSans', fontSize: 21, fontWeight: FontWeight.w500, letterSpacing: -0.15);

/// Body, Button Label
const textL = TextStyle(fontFamily: 'NotoSans', fontSize: 16, fontWeight: FontWeight.w500, letterSpacing: 1.5);

/// Body, Button Label, Sub Text, Caption, Overline, Badge
const textM = TextStyle(fontFamily: 'NotoSans', fontSize: 15, fontWeight: FontWeight.w400, letterSpacing: 0.5);
const textS = TextStyle(fontFamily: 'NotoSans', fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.25);
const textXS = TextStyle(fontFamily: 'NotoSans', fontSize: 11, fontWeight: FontWeight.w300, letterSpacing: 0.15);

class CodartTypography {
  CodartTypography._();

  static final CodartTypography _instance = CodartTypography._();

  factory CodartTypography() => _instance;
}