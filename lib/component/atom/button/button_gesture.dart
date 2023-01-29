part of '../../../codartdesign.dart';

mixin ButtonGestureState<T extends Button> on State<T> {
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

  void onPointerDown(detail) {
    if (!isPressed) {
      setState(() {
        isPressed = true;
      });
    }
  }

  void onPointerUp(detail) {
    if (isPressed) {
      setState(() {
        isPressed = false;
      });
    }
  }

  void onPointerCancel(detail) {
    if (isPressed) {
      setState(() {
        isPressed = false;
      });
    }
  }

  Widget buildButtonGesture({required Widget child}) {
    return ButtonGesture(
      onMouseEnter: onMouseEnter,
      onMouseExit: onMouseExit,
      onPointerDown: onPointerDown,
      onPointerUp: onPointerUp,
      onPointerCancel: onMouseEnter,
      onTap: widget.onTap,
      onLongPress: widget.onLongPress,
      child: child,
    );
  }
}

class ButtonGesture extends StatelessWidget {
  const ButtonGesture({
    required this.onMouseEnter,
    required this.onMouseExit,
    required this.onPointerDown,
    required this.onPointerUp,
    required this.onPointerCancel,
    required this.onTap,
    required this.onLongPress,
    required this.child,
    Key? key,
  }) : super(key: key);

  final PointerEnterEventListener? onMouseEnter;
  final PointerExitEventListener? onMouseExit;
  final PointerDownEventListener? onPointerDown;
  final PointerUpEventListener? onPointerUp;
  final PointerCancelEventListener? onPointerCancel;
  final GestureTapCallback? onTap;
  final GestureLongPressCallback? onLongPress;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: onMouseEnter,
      onExit: onMouseExit,
      child: Listener(
        onPointerDown: onPointerDown,
        onPointerUp: onPointerUp,
        onPointerCancel: onPointerCancel,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onTap,
          onLongPress: onLongPress,
          child: child,
        ),
      ),
    );
  }
}
