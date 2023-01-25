part of '../codartdesign.dart';

enum ComponentSize { xxs, xs, s, m, l, xl, xxl }

class CodartSize {
  static const double bottomNavigationTab = grid * 24;

  static const double xxSmallProfile = grid * 14;
  static const double xSmallProfile = grid * 16;
  static const double smallProfile = grid * 21;
  static const double avatar = grid * 25;
  static const double largeProfile = grid * 30;
  static const double xLargeProfile = grid * 38;
  static const double xxLargeProfile = grid * 44;

  static const double smallIcon = grid * 10;
  static const double icon = grid * 14;
  static const double largeIcon = grid * 19;

  static const double smallDotBadge = 5;
  static const double dotBadge = 8;
  static const double largeDotBadge = 10;
  static const double xLargeDotBadge = 14;
  static const double xxLargeDotBadge = 20;

  static const double smallBadge = 16;
  static const double badge = 18;
  static const double largeBadge = 20;
  static const double xLargeBadge = 24;
  static const double xxLargeBadge = 36;

  static double getDotBadgeSize(BadgeSize badgeSize) {
    switch (badgeSize) {
      case BadgeSize.s:
        return CodartSize.smallDotBadge;
      case BadgeSize.m:
        return CodartSize.dotBadge;
      case BadgeSize.l:
        return CodartSize.largeDotBadge;
      case BadgeSize.xl:
        return CodartSize.xLargeDotBadge;
      case BadgeSize.xxl:
        return CodartSize.xxLargeDotBadge;
    }
  }

  static double getBadgeSize(BadgeSize badgeSize) {
    switch (badgeSize) {
      case BadgeSize.s:
        return CodartSize.smallBadge;
      case BadgeSize.m:
        return CodartSize.badge;
      case BadgeSize.l:
        return CodartSize.largeBadge;
      case BadgeSize.xl:
        return CodartSize.xLargeBadge;
      case BadgeSize.xxl:
        return CodartSize.xxLargeBadge;
    }
  }
}
