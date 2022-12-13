part of '../../../codartdesign.dart';

class Button extends StatefulWidget {
  const Button({
    this.icon,
    this.text,
    this.color,
    this.enable = true,
    required this.onTap,
    this.onLongPress,
    Key? key,
  }) : super(key: key);

  final String? icon;
  final String? text;
  final Color? color;
  final bool enable;

  final GestureTapCallback? onTap;
  final GestureLongPressCallback? onLongPress;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends ButtonState {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return buildGesture(
      child: AnimatedContainer(
        duration: normalDuration,
        curve: easeOutCubic,
        decoration: BoxDecoration(
          color: getButtonColor(),
          borderRadius: BorderRadius.circular(radius200),
        ),
        padding: const EdgeInsets.symmetric(horizontal: spacing400, vertical: spacing300),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ButtonText(widget.text ?? ''),
          ],
        ),
      ),
    );
  }

  Color getButtonColor() {
    final color = widget.color ?? CodartColor().negative.getColor(context);
    if (action == ButtonAction.hover) {
      return color.highlighted;
    } else if (action == ButtonAction.pressed) {
      return color.highlighted;
    } else {
      return color;
    }
  }
}
