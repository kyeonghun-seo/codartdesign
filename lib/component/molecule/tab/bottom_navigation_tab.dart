part of '../../../codartdesign.dart';

class BottomNavigationTab extends StatelessWidget {
  const BottomNavigationTab({
    required this.tabs,
    required this.index,
    this.showBorder = true,
    this.onSelectTap,
    super.key,
  });

  final List<Widget> tabs;
  final int index;
  final bool showBorder;
  final Function(int index)? onSelectTap;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        padding: CodartLayout.pageSidePadding,
        constraints: const BoxConstraints(
          minHeight: CodartSize.bottomNavigationTab,
        ),
        decoration: BoxDecoration(
          border: showBorder
              ? Border(
                  top: BorderSide(color: CodartColor.divider.getColor(context)),
                )
              : null,
        ),
        child: Row(
          children: tabs.map((tab) {
            final i = tabs.indexOf(tab);
            final isSelected = i == index;
            return Expanded(
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => onSelectTap?.call(i),
                child: tab,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
