part of '../../../codartdesign.dart';

class SolidButton extends BoxButton {
  const SolidButton({
    required super.onTap,
    super.icon,
    super.text,
    super.textStyle,
    super.textColor,
    super.color,
    super.enable,
    super.loading,
    super.buttonSize,
    super.onLongPress,
    super.key,
  });

  const SolidButton.xSmall({
    required super.onTap,
    super.icon,
    super.text,
    super.textStyle,
    super.textColor,
    super.color,
    super.enable,
    super.loading,
    super.onLongPress,
    super.key,
  }) : super(buttonSize: BoxButtonSize.xs);

  const SolidButton.small({
    required super.onTap,
    super.icon,
    super.text,
    super.textStyle,
    super.textColor,
    super.color,
    super.enable,
    super.loading,
    super.onLongPress,
    super.key,
  }) : super(buttonSize: BoxButtonSize.s);

  const SolidButton.large({
    required super.onTap,
    super.icon,
    super.text,
    super.textStyle,
    super.textColor,
    super.color,
    super.enable,
    super.loading,
    super.onLongPress,
    super.key,
  }) : super(buttonSize: BoxButtonSize.l);

  const SolidButton.xLarge({
    required super.onTap,
    super.icon,
    super.text,
    super.textStyle,
    super.textColor,
    super.color,
    super.enable,
    super.loading,
    super.onLongPress,
    super.key,
  }) : super(buttonSize: BoxButtonSize.xl);

  @override
  State<SolidButton> createState() => _SolidButtonState();
}

class _SolidButtonState extends BoxButtonState<SolidButton> {
  @override
  Widget build(BuildContext context) {
    return buildGesture(
      child: AnimatedContainer(
        duration: normalDuration,
        curve: easeOutCubic,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: radius,
        ),
        padding: padding,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.text ?? '',
              style: widget.textStyle?.copyWith(color: textColor) ?? textStyle.copyWith(color: textColor),
            ),
          ],
        ),
      ),
    );
  }

  Color get textColor => widget.textColor ?? white;
}
