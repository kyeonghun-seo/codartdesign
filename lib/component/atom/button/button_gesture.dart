part of '../../../codartdesign.dart';

mixin ButtonGesture<T extends Button> on State<T> {
  bool isPressed = false;
  bool isHover = false;

  void onMouseEnter(detail) {
    if (!isHover) {
      setState(() {
        isHover = true;
      });
    }
  }

  void onMouseExit(detail) {
    if (isHover) {
      setState(() {
        isHover = false;
      });
    }
  }

  void onTapDown(detail) {
    if (!isPressed) {
      setState(() {
        isPressed = true;
      });
    }
  }

  void onTapUp(detail) {
    if (isPressed) {
      setState(() {
        isPressed = false;
      });
    }
  }

  void onTapCancel() {
    if (isPressed) {
      setState(() {
        isPressed = false;
      });
    }
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
        child: child
      ),
    );
  }
}