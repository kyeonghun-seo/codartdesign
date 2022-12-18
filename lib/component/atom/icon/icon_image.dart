part of '../../../codartdesign.dart';

class IconImage extends Icon {
  const IconImage({
    required super.icon,
    super.color,
    super.iconSize,
    super.key,
  });

  const IconImage.small({
    required super.icon,
    super.color,
    super.key,
  }): super(iconSize: IconSize.s);

  const IconImage.large({
    required super.icon,
    super.color,
    super.key,
  }): super(iconSize: IconSize.l);

  @override
  Widget build(BuildContext context) {
    final iconColor = color ?? CodartColor.text.getColor(context);
    final size = this.size;

    if(icon.endsWith('.svg')) {
      return SvgPicture.asset(
        icon,
        width: size,
        height: size,
        color: iconColor,
      );
    }else {
      return Image.asset(
        icon,
        width: size,
        height: size,
        color: iconColor,
      );
    }
  }
}
