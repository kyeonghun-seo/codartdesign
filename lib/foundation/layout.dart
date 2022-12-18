part of '../codartdesign.dart';

const double grid = 2.0;

const double radiusXs = 1.0;
const double radiusS = 3.0;
const double radiusM = 5.0;
const double radiusL = 7.0;
const double radiusXl = 12.0;

const double borderT = 0.5;
const double borderR = 1.0;
const double borderM = 2.0;

class CodartLayout {
  static EdgeInsets pageSidePadding = const EdgeInsets.symmetric(horizontal: grid * 8);

  static EdgeInsets iconButtonPadding = const EdgeInsets.all(grid * 2);
}

class CodartRadius {

  static Radius base = const Radius.circular(radiusM);

  static BorderRadius button = const BorderRadius.only(
    topLeft: Radius.circular(radiusM),
    topRight: Radius.circular(radiusM),
    bottomLeft: Radius.circular(radiusM),
    bottomRight: Radius.circular(radiusM),
  );
}

class CodartBorderWidth {
  CodartBorderWidth._();

  static final CodartBorderWidth _instance = CodartBorderWidth._();

  factory CodartBorderWidth() => _instance;
}

class CodartSize {
  static const double bottomNavigationTab = grid * 24;

  static const double xxSmallProfile = grid * 14;
  static const double xSmallProfile = grid * 16;
  static const double smallProfile = grid * 21;
  static const double avatar = grid * 25;
  static const double largeProfile = grid * 23;
  static const double xLargeProfile = grid * 30;
  static const double xxLargeProfile = grid * 44;

  static const double smallIcon = grid * 10;
  static const double icon = grid * 14;
  static const double largeIcon = grid * 19;
}
