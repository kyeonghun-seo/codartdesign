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
    super.buttonSize,
    super.onLongPress,
    Key? key,
  }) : super(key: key);

  factory SolidButton.small({
    required GestureTapCallback onTap,
    String? icon,
    String? text,
    TextStyle? textStyle,
    Color? textColor,
    Color? color,
    bool? enable,
    GestureLongPressCallback? onLongPress,
    Key? key,
  }) {
    return SolidButton(
      onTap: onTap,
      icon: icon,
      text: text,
      textStyle: textStyle,
      color: color,
      enable: enable ?? true,
      buttonSize: ButtonSize.s,
      onLongPress: onLongPress,
      key: key,
    );
  }

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
          borderRadius: BorderRadius.circular(radius100),
        ),
        padding: const EdgeInsets.symmetric(horizontal: spacing600, vertical: spacing200),
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
