part of '../../../codartdesign.dart';

enum ButtonAction { normal, hover, pressed }

class ButtonState extends State<Button> {
  ButtonAction action = ButtonAction.normal;

  void onMouseEnter(detail) {
    if (action != ButtonAction.hover) {
      setState(() {
        action = ButtonAction.hover;
      });
    }
  }

  void onMouseExit(detail) {
    if (action != ButtonAction.normal) {
      setState(() {
        action = ButtonAction.normal;
      });
    }
  }

  void onTapDown(detail) {
    if (action != ButtonAction.pressed) {
      setState(() {
        action = ButtonAction.pressed;
      });
    }
  }

  void onTapUp(detail) {
    if (action != ButtonAction.normal) {
      setState(() {
        action = ButtonAction.normal;
      });
    }
  }

  void onTapCancel() {
    if (action != ButtonAction.normal) {
      setState(() {
        action = ButtonAction.normal;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }

  Widget buildGesture({required Widget child}) {
    return MouseRegion(
      onEnter: onMouseEnter,
      onExit: onMouseExit,
      child: GestureDetector(
        onTap: widget.onTap,
        onTapDown: onTapDown,
        onTapUp: onTapUp,
        onTapCancel: onTapCancel,
        onLongPress: widget.onLongPress,
        child: child,
      ),
    );
  }
}
