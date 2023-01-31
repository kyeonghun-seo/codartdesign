part of '../../../codartdesign.dart';

class DotBadge extends Badge {
  const DotBadge({
    super.color,
    super.badgeSize,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = CodartSize.getDotBadgeSize(badgeSize);
    final borderColor = CodartColor.background.getColor(context);
    return SizedBox.square(
      dimension: size,
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color ?? context.mainColor,
          border: Border.all(color: borderColor, width: size / 9),
        ),
      ),
    );
  }
}
