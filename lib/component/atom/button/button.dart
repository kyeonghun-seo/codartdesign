part of '../../../codartdesign.dart';

enum ButtonSize { xs, s, m, l, xl }

abstract class Button extends StatefulWidget {
  const Button({
    required this.onTap,
    this.icon,
    this.text,
    this.textStyle,
    this.textColor,
    this.color,
    this.enable = true,
    this.loading = false,
    this.buttonSize = ButtonSize.m,
    this.onLongPress,
    Key? key,
  }) : super(key: key);

  final String? icon;
  final String? text;
  final Color? textColor;
  final TextStyle? textStyle;
  final Color? color;
  final bool enable;
  final bool loading;
  final ButtonSize buttonSize;
  final GestureTapCallback onTap;
  final GestureLongPressCallback? onLongPress;
}

abstract class ButtonState<T extends Button> extends State<T> with ButtonGesture {

  Color get buttonColor {
    final color = widget.color ?? CodartColor().main.getColor(context);
    if (isPressed) {
      return color.highlighted;
    } else if (isHover) {
      return color.hover;
    } else {
      return color;
    }
  }

  TextStyle get textStyle {
    switch(widget.buttonSize) {
      case ButtonSize.xs:
        return textXS;
      case ButtonSize.s:
        return textS;
      case ButtonSize.m:
        return textM;
      case ButtonSize.l:
      case ButtonSize.xl:
        return textL;
    }
  }

  EdgeInsets get padding {
    switch(widget.buttonSize) {
      case ButtonSize.xs:
        return const EdgeInsets.symmetric(horizontal: grid * 3, vertical: grid * 2);
      case ButtonSize.s:
        return const EdgeInsets.symmetric(horizontal: grid * 5, vertical: grid * 3);
      case ButtonSize.m:
        return const EdgeInsets.symmetric(horizontal: grid * 8, vertical: grid * 3);
      case ButtonSize.l:
        return const EdgeInsets.symmetric(horizontal: grid * 14, vertical: grid * 4);
      case ButtonSize.xl:
        return const EdgeInsets.symmetric(horizontal: grid * 20, vertical: grid * 5);
    }
  }

}
