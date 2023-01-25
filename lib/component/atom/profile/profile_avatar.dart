part of '../../../codartdesign.dart';

enum ProfileSize { xxs, xs, s, m, l, xl, xxl }

abstract class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({
    this.text,
    this.image,
    this.backgroundColor,
    this.profileSize = ProfileSize.m,
    this.ringColor,
    this.ringWidth,
    this.showDotBadge,
    this.numberBadgeCount,
    this.iconBadgePath,
    this.badgeColor,
    this.icon,
    this.onTap,
    super.key,
  }) : assert(numberBadgeCount == null || iconBadgePath == null);

  final String? text;
  final ImageProvider? image;
  final Color? backgroundColor;
  final ProfileSize profileSize;
  final Color? ringColor;
  final double? ringWidth;
  final bool? showDotBadge;
  final int? numberBadgeCount;
  final String? iconBadgePath;
  final Color? badgeColor;
  final Widget? icon;
  final Function? onTap;

  double get size {
    switch (profileSize) {
      case ProfileSize.xxs:
        return CodartSize.xxSmallProfile;
      case ProfileSize.xs:
        return CodartSize.xSmallProfile;
      case ProfileSize.s:
        return CodartSize.smallProfile;
      case ProfileSize.m:
        return CodartSize.avatar;
      case ProfileSize.l:
        return CodartSize.largeProfile;
      case ProfileSize.xl:
        return CodartSize.xLargeProfile;
      case ProfileSize.xxl:
        return CodartSize.xxLargeProfile;
    }
  }

  double get strokeWidth {
    switch (profileSize) {
      case ProfileSize.xxs:
      case ProfileSize.xs:
        return borderR;
      case ProfileSize.s:
      case ProfileSize.m:
      case ProfileSize.l:
      case ProfileSize.xl:
      case ProfileSize.xxl:
        return borderM;
    }
  }

  BadgeSize get badgeSize {
    switch (profileSize) {
      case ProfileSize.xxs:
      case ProfileSize.xs:
        return BadgeSize.s;
      case ProfileSize.s:
      case ProfileSize.m:
        return BadgeSize.m;
      case ProfileSize.l:
        return BadgeSize.l;
      case ProfileSize.xl:
        return BadgeSize.xl;
      case ProfileSize.xxl:
        return BadgeSize.xxl;
    }
  }
}
