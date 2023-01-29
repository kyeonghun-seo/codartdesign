part of '../../../codartdesign.dart';

enum BoxButtonSize { xs, s, m, l, xl }

/// 버튼의 추상화
abstract class Button extends StatefulWidget {
  const Button({
    this.onTap,
    this.enable = true,
    this.loading = false,
    this.onLongPress,
    super.key,
  });

  final bool enable;
  final bool loading;
  final GestureTapCallback? onTap;
  final GestureLongPressCallback? onLongPress;

  bool get isEnable => enable && (onTap != null || onLongPress != null);
}

/// 버튼의 상태
abstract class ButtonState<T extends Button> extends State<T> with ButtonGestureState {}

/// 아이콘, 텍스트, 사이즈를 가지는 버튼의 추상화
abstract class BoxButton extends Button {
  const BoxButton({
    super.onTap,
    this.icon,
    this.text,
    this.textStyle,
    this.textColor,
    this.color,
    this.buttonSize = BoxButtonSize.m,
    super.enable = true,
    super.loading = false,
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

/// 박스버튼의 상태
abstract class BoxButtonState<T extends BoxButton> extends State<T> with ButtonGestureState {
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

  Color get disableColor => CodartColor.disable.getColor(context);

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

  BorderRadius get radius {
    switch (widget.buttonSize) {
      case BoxButtonSize.xs:
        return CodartRadius.allSmall;
      case BoxButtonSize.s:
        return CodartRadius.allNormal;
      case BoxButtonSize.m:
        return CodartRadius.allNormal;
      case BoxButtonSize.l:
        return CodartRadius.allLarge;
      case BoxButtonSize.xl:
        return CodartRadius.allLarge;
    }
  }
}
