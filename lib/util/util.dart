part of '../codartdesign.dart';

extension BuildContextX on BuildContext {

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  bool get isDarkMode => mediaQuery.platformBrightness == Brightness.dark;

  Size get size => mediaQuery.size;
  double get topPadding => mediaQuery.padding.top;
  double get bottomPadding => mediaQuery.padding.bottom;

}