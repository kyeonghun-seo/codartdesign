part of '../../../codartdesign.dart';

enum ButtonAction { normal, hover, pressed }

enum ButtonSize { small, medium, large, xlarge }

mixin Button on State<BoxButton> {
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

  Widget buildButton({
    required BoxDecoration boxDecoration,
  }) {
    return MouseRegion(
      onEnter: onMouseEnter,
      onExit: onMouseExit,
      child: GestureDetector(
        onTap: widget.onTap,
        onTapDown: onTapDown,
        onTapUp: onTapUp,
        onTapCancel: onTapCancel,
        onLongPress: widget.onLongPress,
        child: AnimatedContainer(
          duration: normalDuration,
          curve: easeOutCubic,
          decoration: BoxDecoration(
            color: getButtonColor(),
            borderRadius: BorderRadius.circular(radius300),
          ),
          padding: const EdgeInsets.symmetric(horizontal: spacing800, vertical: spacing300),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ButtonText(widget.text ?? ''),
            ],
          ),
        ),
      ),
    );
  }

  Color getButtonColor() {
    final color = widget.color ?? CodartColor().negative.getColor(context);
    if (action == ButtonAction.hover) {
      // return color.hover;
      return color;
    } else if (action == ButtonAction.pressed) {
      return color.highlighted;
    } else {
      return color;
    }
  }
}
