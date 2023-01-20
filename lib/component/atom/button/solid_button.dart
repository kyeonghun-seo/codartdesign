part of '../../../codartdesign.dart';

class SolidButton extends BoxButton {
  const SolidButton({
    super.onTap,
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
    super.onTap,
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
    super.onTap,
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
    super.onTap,
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
    super.onTap,
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
    final isEnable = widget.enable && (widget.onTap != null || widget.onLongPress != null);
    final textColor = isEnable ? (widget.textColor ?? white) : CodartColor.secondaryText.getColor(context);
    final solid = AnimatedContainer(
      duration: normalDuration,
      curve: easeOutCubic,
      decoration: BoxDecoration(
        color: isEnable ? buttonColor : disableColor,
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
    );

    if (isEnable) {
      return buildGesture(child: solid);
    } else {
      return solid;
    }
  }
}
