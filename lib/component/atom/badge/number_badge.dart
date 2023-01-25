part of '../../../codartdesign.dart';

class NumberBadge extends Badge {
  const NumberBadge({
    this.number,
    super.color,
    super.badgeSize,
    super.key,
  });

  final int? number;

  @override
  Widget build(BuildContext context) {
    final size = CodartSize.getBadgeSize(badgeSize);
    final count = number ?? 0;
    return AnimatedSize(
      duration: normalDuration,
      curve: easeOutCubic,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: size, minWidth: size),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: color ?? context.mainColor,
            borderRadius: BorderRadius.horizontal(left: Radius.circular(size / 2), right: Radius.circular(size / 2)),
            border: Border.all(color: context.backgroundColor, width: borderWidth),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: sidePadding),
            child: Center(
              child: StyledText(
                count > 99 ? '99+' : '$count',
                textStyle,
                color: context.backgroundColor,
              ),
            ),
          ),
        ),
      ),
    );
  }

  double get sidePadding {
    switch (badgeSize) {
      case BadgeSize.s:
        return 4;
      case BadgeSize.m:
        return 6;
      case BadgeSize.l:
        return 8;
      case BadgeSize.xl:
        return 9;
      case BadgeSize.xxl:
        return 10;
    }
  }

  TextStyle get textStyle {
    switch (badgeSize) {
      case BadgeSize.s:
      case BadgeSize.m:
        return textXS;
      case BadgeSize.l:
        return textS;
      case BadgeSize.xl:
        return titleXS;
      case BadgeSize.xxl:
        return titleM;
    }
  }
}
