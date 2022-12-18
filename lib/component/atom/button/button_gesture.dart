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

  void onTapCancel(detail) {
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
      child: Listener(
        onPointerDown: onTapDown,
        onPointerUp: onTapUp,
        onPointerCancel: onTapCancel,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: widget.onTap,
          onLongPress: widget.onLongPress,
          child: child
        ),
      ),
    );
  }
}