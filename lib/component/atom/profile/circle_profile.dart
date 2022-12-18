part of '../../../codartdesign.dart';

class CircleProfile extends Profile {
  const CircleProfile({
    super.text,
    super.image,
    super.backgroundColor,
    super.profileSize = ProfileSize.m,
    super.ringColor,
    super.ringWidth,
    super.badge,
    super.icon,
    super.key,
  });

  const CircleProfile.xxSmall({
    super.text,
    super.image,
    super.backgroundColor,
    super.ringColor,
    super.ringWidth,
    super.badge,
    super.icon,
    super.key,
  }) : super(profileSize: ProfileSize.xxs);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ClipOval(
          child: SizedBox.square(
            dimension: size - strokeWidth * 3,
            child: image != null
                ? Image(
                    image: image!,
                    fit: BoxFit.cover,
                  )
                : DecoratedBox(
                    decoration: BoxDecoration(
                      color: CodartColor.tertiaryBackground.getColor(context),
                    ),
                    child: SvgPicture.asset(
                      'assets/images/ic_profile.svg',
                      width: size,
                      height: size,
                      color: CodartColor.text.getColor(context),
                    ),
                  ),
          ),
        ),
        if (ringColor != null)
          SizedBox.square(
            dimension: size,
            child: CustomPaint(
              painter: RingPainter(
                color: ringColor!,
                strokeWidth: ringWidth ?? strokeWidth,
              ),
            ),
          )
      ],
    );
  }
}
