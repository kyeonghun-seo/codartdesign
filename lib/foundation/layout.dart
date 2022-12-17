part of '../codartdesign.dart';

const double grid = 2.0;
const double spacing4 = 4.0;
const double spacing8 = 8.0;
const double spacing12 = 12.0;
const double spacing16 = 16.0;
const double spacing20 = 20.0;
const double spacing24 = 24.0;
const double spacing28 = 28.0;
const double spacing32 = 32.0;
const double spacing36 = 36.0;
const double spacing40 = 40.0;
const double spacing44 = 44.0;
const double spacing48 = 48.0;
const double spacing52 = 52.0;
const double spacing56 = 56.0;

const double radiusXs = 1.0;
const double radiusS = 3.0;
const double radiusM = 5.0;
const double radiusL = 7.0;
const double radiusXl = 12.0;

const double border50 = 0.5;
const double border100 = 1.0;
const double border200 = 2.0;

class CodartSpacing {
  CodartSpacing._();

  static final CodartSpacing _instance = CodartSpacing._();

  factory CodartSpacing() => _instance;

  final buttonPaddingXs = const EdgeInsets.symmetric(horizontal: grid * 2, vertical: grid);
  final buttonPaddingS = const EdgeInsets.symmetric(horizontal: spacing8, vertical: spacing4);
  final buttonPaddingM = const EdgeInsets.symmetric(horizontal: spacing16, vertical: spacing8);
  final buttonPaddingL = const EdgeInsets.symmetric(horizontal: spacing8, vertical: spacing4);
  final buttonPaddingXl = const EdgeInsets.symmetric(horizontal: spacing8, vertical: spacing4);
}

class CodartRadius {
  CodartRadius._();

  static final CodartRadius _instance = CodartRadius._();

  factory CodartRadius() => _instance;

  Radius base = const Radius.circular(radiusS);

  BorderRadius button = const BorderRadius.only(
    topLeft: Radius.circular(radiusS),
    topRight: Radius.circular(radiusS),
    bottomLeft: Radius.circular(radiusS),
    bottomRight: Radius.circular(radiusS),
  );
}

class CodartBorderWidth {
  CodartBorderWidth._();

  static final CodartBorderWidth _instance = CodartBorderWidth._();

  factory CodartBorderWidth() => _instance;
}
