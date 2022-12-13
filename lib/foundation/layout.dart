part of '../codartdesign.dart';

const double spacing50 = 2.0;
const double spacing100 = 4.0;
const double spacing200 = 8.0;
const double spacing300 = 12.0;
const double spacing400 = 16.0;
const double spacing500 = 20.0;
const double spacing600 = 24.0;
const double spacing700 = 28.0;
const double spacing800 = 32.0;
const double spacing900 = 36.0;
const double spacing1000 = 40.0;
const double spacing1100 = 44.0;
const double spacing1200 = 48.0;
const double spacing1300 = 52.0;
const double spacing1400 = 56.0;

const double radius50 = 1.0;
const double radius100 = 3.0;
const double radius200 = 5.0;
const double radius300 = 7.0;
const double radius400 = 12.0;

const double border50 = 0.5;
const double border100 = 1.0;
const double border200 = 2.0;

class CodartSpacing {
  CodartSpacing._();

  static final CodartSpacing _instance = CodartSpacing._();

  factory CodartSpacing() => _instance;
}

class CodartRadius {
  CodartRadius._();

  static final CodartRadius _instance = CodartRadius._();

  factory CodartRadius() => _instance;
}

class CodartBorderWidth {
  CodartBorderWidth._();

  static final CodartBorderWidth _instance = CodartBorderWidth._();

  factory CodartBorderWidth() => _instance;
}