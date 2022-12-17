part of '../../../codartdesign.dart';

class SolidButton extends Button {
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
  }) : super(buttonSize: ButtonSize.xs);

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
  }) : super(buttonSize: ButtonSize.s);

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
  }) : super(buttonSize: ButtonSize.l);

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
  }) : super(buttonSize: ButtonSize.xl);

  @override
  State<SolidButton> createState() => _SolidButtonState();
}

class _SolidButtonState extends ButtonState<SolidButton> {
  @override
  Widget build(BuildContext context) {
    return buildGesture(
      child: AnimatedContainer(
        duration: normalDuration,
        curve: easeOutCubic,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: CodartRadius().button,
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
