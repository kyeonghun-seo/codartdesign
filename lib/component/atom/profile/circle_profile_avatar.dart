part of '../../../codartdesign.dart';

class CircleProfileAvatar extends ProfileAvatar {
  const CircleProfileAvatar({
    super.text,
    super.image,
    super.backgroundColor,
    super.profileSize = ProfileSize.m,
    super.ringColor,
    super.ringWidth,
    super.showDotBadge,
    super.numberBadgeCount,
    super.iconBadgePath,
    super.badgeColor,
    super.icon,
    super.enable,
    super.loading,
    super.onLongPress,
    super.onTap,
    super.key,
  });

  const CircleProfileAvatar.xxLarge({
    super.text,
    super.image,
    super.backgroundColor,
    super.ringColor,
    super.ringWidth,
    super.showDotBadge,
    super.numberBadgeCount,
    super.iconBadgePath,
    super.badgeColor,
    super.icon,
    super.enable,
    super.loading,
    super.onLongPress,
    super.onTap,
    super.key,
  }) : super(profileSize: ProfileSize.xxl);

  const CircleProfileAvatar.xLarge({
    super.text,
    super.image,
    super.backgroundColor,
    super.ringColor,
    super.ringWidth,
    super.showDotBadge,
    super.numberBadgeCount,
    super.iconBadgePath,
    super.badgeColor,
    super.icon,
    super.enable,
    super.loading,
    super.onLongPress,
    super.onTap,
    super.key,
  }) : super(profileSize: ProfileSize.xl);

  const CircleProfileAvatar.large({
    super.text,
    super.image,
    super.backgroundColor,
    super.ringColor,
    super.ringWidth,
    super.showDotBadge,
    super.numberBadgeCount,
    super.iconBadgePath,
    super.badgeColor,
    super.icon,
    super.enable,
    super.loading,
    super.onLongPress,
    super.onTap,
    super.key,
  }) : super(profileSize: ProfileSize.l);

  const CircleProfileAvatar.small({
    super.text,
    super.image,
    super.backgroundColor,
    super.ringColor,
    super.ringWidth,
    super.showDotBadge,
    super.numberBadgeCount,
    super.iconBadgePath,
    super.badgeColor,
    super.icon,
    super.enable,
    super.loading,
    super.onLongPress,
    super.onTap,
    super.key,
  }) : super(profileSize: ProfileSize.s);

  const CircleProfileAvatar.xSmall({
    super.text,
    super.image,
    super.backgroundColor,
    super.ringColor,
    super.ringWidth,
    super.showDotBadge,
    super.numberBadgeCount,
    super.iconBadgePath,
    super.badgeColor,
    super.icon,
    super.enable,
    super.loading,
    super.onLongPress,
    super.onTap,
    super.key,
  }) : super(profileSize: ProfileSize.xs);

  const CircleProfileAvatar.xxSmall({
    super.text,
    super.image,
    super.backgroundColor,
    super.ringColor,
    super.ringWidth,
    super.showDotBadge,
    super.numberBadgeCount,
    super.iconBadgePath,
    super.badgeColor,
    super.icon,
    super.enable,
    super.loading,
    super.onLongPress,
    super.onTap,
    super.key,
  }) : super(profileSize: ProfileSize.xxs);

  @override
  State<CircleProfileAvatar> createState() => _CircleProfileAvatarState();
}

class _CircleProfileAvatarState extends ButtonState<CircleProfileAvatar> {
  @override
  Widget build(BuildContext context) {
    final child = SizedBox.square(
      dimension: widget.size,
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: widget.backgroundColor ?? CodartColor.tertiaryBackground.getColor(context),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            ClipOval(
              child: widget.image != null
                  ? Image(
                      image: widget.image!,
                      width: widget.size,
                      height: widget.size,
                      fit: BoxFit.cover,
                    )
                  : SvgPicture.asset(
                      'assets/images/ic_profile.svg',
                      width: widget.size,
                      height: widget.size,
                      color: CodartColor.secondaryText.getColor(context),
                    ),
            ),
            if (widget.ringColor != null)
              CustomPaint(
                size: Size.square(widget.size),
                painter: RingPainter(
                  color: widget.ringColor!,
                  strokeWidth: widget.ringWidth ?? widget.strokeWidth,
                ),
              ),
            if (widget.showDotBadge ?? false)
              Positioned(
                right: widget.size / 6.5 - CodartSize.getDotBadgeSize(widget.badgeSize) / 2,
                top: widget.size / 6.5 - CodartSize.getDotBadgeSize(widget.badgeSize) / 2,
                child: DotBadge(
                  color: widget.badgeColor,
                  badgeSize: widget.badgeSize,
                ),
              ),
            if ((widget.numberBadgeCount ?? 0) > 0)
              Positioned(
                right: 0,
                bottom: 0,
                child: NumberBadge(
                  color: widget.badgeColor,
                  badgeSize: widget.badgeSize,
                  number: widget.numberBadgeCount,
                ),
              ),
          ],
        ),
      ),
    );

    if (widget.isEnable) {
      return buildButtonGesture(child: child);
    } else {
      return child;
    }
  }
}
