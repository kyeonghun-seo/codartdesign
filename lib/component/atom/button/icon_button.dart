part of '../../../codartdesign.dart';

class IconImageButton extends Button {
  const IconImageButton({
    required this.icon,
    this.text,
    this.color,
    this.iconSize = IconSize.m,
    super.enable,
    super.loading,
    super.onTap,
    super.onLongPress,
    super.key,
  });

  const IconImageButton.small({
    required this.icon,
    this.text,
    this.color,
    this.iconSize = IconSize.s,
    super.enable,
    super.loading,
    super.onTap,
    super.onLongPress,
    super.key,
  });

  const IconImageButton.large({
    required this.icon,
    this.text,
    this.color,
    this.iconSize = IconSize.l,
    super.enable,
    super.loading,
    super.onTap,
    super.onLongPress,
    super.key,
  });

  final String icon;
  final String? text;
  final Color? color;
  final IconSize iconSize;

  @override
  State<IconImageButton> createState() => _IconImageButtonState();
}

class _IconImageButtonState extends ButtonState<IconImageButton> {
  @override
  Widget build(BuildContext context) {
    final color = buttonColor;

    return buildGesture(
      child: AnimatedContainer(
        padding: CodartLayout.iconButtonPadding,
        duration: normalDuration,
        curve: easeOutCubic,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconImage(
              icon: widget.icon ?? '',
              color: color,
              iconSize: widget.iconSize,
            ),
            if(widget.text != null) Text(
              widget.text ?? '',
              style: textXS.copyWith(color: color),
            ),
          ],
        ),
      ),
    );
  }

  Color get buttonColor {
    final color = widget.color ?? CodartColor.text.getColor(context);
    if (isPressed) {
      return color.pressed;
    } else if (isHover) {
      return color.hover;
    } else {
      return color;
    }
  }
}
