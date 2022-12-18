part of '../../../codartdesign.dart';

enum IconSize { s, m, l, }

abstract class Icon extends StatelessWidget {
  const Icon({
    required this.icon,
    this.color,
    this.iconSize = IconSize.m,
    Key? key,
  }) : super(key: key);

  final String icon;
  final Color? color;
  final IconSize iconSize;

  double get size {
    switch(iconSize) {
      case IconSize.s:
        return CodartSize.smallIcon;
      case IconSize.m:
        return CodartSize.icon;
      case IconSize.l:
        return CodartSize.largeIcon;
    }
  }
}