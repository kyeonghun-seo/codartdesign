part of '../../../codartdesign.dart';

class DotBadge extends Badge {
  const DotBadge({
    super.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: CodartSize.badge,
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color ?? context.mainColor,
          border: Border.all(color: CodartColor.background.getColor(context), width: 2),
        ),
      ),
    );
  }
}
