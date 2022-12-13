part of '../../../codartdesign.dart';

class BoxButton extends StatefulWidget {
  const BoxButton({
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
  State<BoxButton> createState() => _BoxButtonState();
}

class _BoxButtonState extends State<BoxButton> with Button {

  @override
  Widget build(BuildContext context) {
    return buildButton(boxDecoration: BoxDecoration(
      color: getButtonColor(),
      borderRadius: BorderRadius.circular(radius300),
    ));
  }
}