part of '../../../codartdesign.dart';

enum BoxButtonSize { xs, s, m, l, xl }

abstract class Button extends StatefulWidget {
  const Button({
    required this.onTap,
    this.enable = true,
    this.loading = false,
    this.onLongPress,
    super.key,
  });

  final bool enable;
  final bool loading;
  final GestureTapCallback? onTap;
  final GestureLongPressCallback? onLongPress;
}

abstract class ButtonState<T extends Button> extends State<T> with ButtonGesture {}

abstract class BoxButton extends Button {
  const BoxButton({
    required super.onTap,
    this.icon,
    this.text,
    this.textStyle,
    this.textColor,
    this.color,
    super.enable = true,
    super.loading = false,
    this.buttonSize = BoxButtonSize.m,
    super.onLongPress,
    super.key,
  });

  final String? icon;
  final String? text;
  final Color? textColor;
  final TextStyle? textStyle;
  final Color? color;
  final BoxButtonSize buttonSize;
}

abstract class BoxButtonState<T extends BoxButton> extends State<T> with ButtonGesture {
  Color get buttonColor {
    final color = widget.color ?? CodartColor.main.getColor(context);
    if (isPressed) {
      return color.highlighted;
    } else if (isHover) {
      return color.hover;
    } else {
      return color;
    }
  }

  TextStyle get textStyle {
    switch (widget.buttonSize) {
      case BoxButtonSize.xs:
        return textXS;
      case BoxButtonSize.s:
        return textS;
      case BoxButtonSize.m:
        return textM;
      case BoxButtonSize.l:
      case BoxButtonSize.xl:
        return textL;
    }
  }

  EdgeInsets get padding {
    switch (widget.buttonSize) {
      case BoxButtonSize.xs:
        return const EdgeInsets.symmetric(horizontal: grid * 3, vertical: grid * 2);
      case BoxButtonSize.s:
        return const EdgeInsets.symmetric(horizontal: grid * 5, vertical: grid * 3);
      case BoxButtonSize.m:
        return const EdgeInsets.symmetric(horizontal: grid * 8, vertical: grid * 3);
      case BoxButtonSize.l:
        return const EdgeInsets.symmetric(horizontal: grid * 14, vertical: grid * 4);
      case BoxButtonSize.xl:
        return const EdgeInsets.symmetric(horizontal: grid * 20, vertical: grid * 5);
    }
  }
}
