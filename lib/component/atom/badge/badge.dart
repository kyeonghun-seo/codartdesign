part of '../../../codartdesign.dart';

enum BadgeSize { s, m, l, xl, xxl }

abstract class Badge extends StatelessWidget {
  const Badge({
    this.color,
    this.badgeSize = BadgeSize.m,
    super.key,
  });

  final Color? color;
  final BadgeSize badgeSize;

  double get borderWidth {
    switch (badgeSize) {
      case BadgeSize.s:
        return 1.5;
      case BadgeSize.m:
        return 1.5;
      case BadgeSize.l:
        return 2;
      case BadgeSize.xl:
        return 2.5;
      case BadgeSize.xxl:
        return 2.5;
    }
  }
}
