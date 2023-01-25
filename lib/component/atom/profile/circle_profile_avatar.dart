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
    super.onTap,
    super.key,
  }) : super(profileSize: ProfileSize.xxs);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap != null ? () => onTap?.call() : null,
      child: SizedBox.square(
        dimension: size,
        child: DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: backgroundColor ?? CodartColor.tertiaryBackground.getColor(context),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              ClipOval(
                child: image != null
                    ? Image(
                        image: image!,
                        width: size,
                        height: size,
                        fit: BoxFit.cover,
                      )
                    : SvgPicture.asset(
                        'assets/images/ic_profile.svg',
                        width: size,
                        height: size,
                        color: CodartColor.secondaryText.getColor(context),
                      ),
              ),
              if (ringColor != null)
                CustomPaint(
                  size: Size.square(size),
                  painter: RingPainter(
                    color: ringColor!,
                    strokeWidth: ringWidth ?? strokeWidth,
                  ),
                ),
              if (showDotBadge ?? false)
                Positioned(
                  right: size / 6.5 - CodartSize.getDotBadgeSize(badgeSize) / 2,
                  top: size / 6.5 - CodartSize.getDotBadgeSize(badgeSize) / 2,
                  child: DotBadge(
                    color: badgeColor,
                    badgeSize: badgeSize,
                  ),
                ),
              if ((numberBadgeCount ?? 0) > 0)
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: NumberBadge(
                    color: badgeColor,
                    badgeSize: badgeSize,
                    number: numberBadgeCount,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
