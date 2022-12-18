part of '../../../codartdesign.dart';

class Background extends StatelessWidget {
  const Background({
    this.child,
    super.key,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: context.isDarkMode
          ? SystemUiOverlayStyle.light
          : SystemUiOverlayStyle.dark.copyWith(statusBarColor: transparent),
      child: DecoratedBox(
        decoration: BoxDecoration(color: CodartColor.background.getColor(context)),
        child: child,
      ),
    );
  }
}
