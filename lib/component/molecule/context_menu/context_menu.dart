part of '../../../codartdesign.dart';

class ContextMenuRegion extends StatelessWidget {
  const ContextMenuRegion({
    Key? key,
    required this.child,
    required this.contextMenu,
    this.isEnabled = true,
    this.enableTap = true,
    this.enableLongPress = false,
  }) : super(key: key);
  final Widget child;
  final Widget contextMenu;
  final bool isEnabled;
  final bool enableTap;
  final bool enableLongPress;

  @override
  Widget build(BuildContext context) {
    void showMenu() {
      // calculate widget position on screen
      context.codartDesign.show(contextMenu);
    }

    if (isEnabled == false) return child;
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onSecondaryTap: showMenu,
      onTap: enableTap ? showMenu : null,
      onLongPress: enableLongPress ? showMenu : null,
      child: child,
    );
  }
}
