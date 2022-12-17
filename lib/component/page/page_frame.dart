part of '../../codartdesign.dart';

class PageFrame extends StatelessWidget {
  const PageFrame({
    this.header,
    this.navigation,
    this.body,
    this.footer,
    this.onTap,
    super.key,
  });

  final Widget? header;
  final Widget? navigation;
  final Widget? body;
  final Widget? footer;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = [];

    if (header != null) children.add(header!);

    if (navigation != null) children.add(navigation!);

    children.add(Expanded(child: body ?? const SizedBox.shrink()));

    if (footer != null) children.add(footer!);

    return Background(
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: children,
        ),
      ),
    );
  }
}
