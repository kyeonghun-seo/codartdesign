library codartdesign;

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

///atom/badge
part 'component/atom/badge/badge.dart';
part 'component/atom/badge/dot_badge.dart';
part 'component/atom/badge/number_badge.dart';

///atom/button
part 'component/atom/button/button.dart';
part 'component/atom/button/button_gesture.dart';
part 'component/atom/button/icon_button.dart';
part 'component/atom/button/solid_button.dart';

///atom/icon
part 'component/atom/icon/icon.dart';
part 'component/atom/icon/icon_image.dart';

///atom/layout
part 'component/atom/layout/background.dart';
part 'component/atom/layout/gap.dart';

///atom/profile
part 'component/atom/profile/circle_profile_avatar.dart';
part 'component/atom/profile/profile_avatar.dart';

///atom/shape
part 'component/atom/shape/ring.dart';

///atom/text
part 'component/atom/text/context_title.dart';
part 'component/atom/text/text.dart';

///molecule/context_menu
part 'component/molecule/context_menu/context_menu.dart';
part 'component/molecule/context_menu/context_menu_button.dart';
part 'component/molecule/context_menu/context_menu_card.dart';
part 'component/molecule/context_menu/context_menu_divider.dart';
part 'component/molecule/context_menu/context_menu_state_mixin.dart';
part 'component/molecule/context_menu/generic_context_menu.dart';
part 'component/molecule/context_menu/link_context_menu.dart';
part 'component/molecule/context_menu/measure_size_widget.dart';
part 'component/molecule/context_menu/text_context_menu.dart';

///molecule/tab
part 'component/molecule/tab/bottom_navigation_tab.dart';

///page
part 'component/page/page_frame.dart';
part 'foundation/animation.dart';

///foundation
part 'foundation/color.dart';
part 'foundation/layout.dart';
part 'foundation/size.dart';
part 'foundation/typography.dart';
part 'foundation/value.dart';

///util
part 'util/util.dart';

class CodartDesign extends StatefulWidget {
  const CodartDesign({
    Key? key,
    required this.child,
    this.cardBuilder,
    this.buttonBuilder,
    this.dividerBuilder,
    this.buttonStyle = const ContextMenuButtonStyle(),
  }) : super(key: key);
  final Widget child;

  /// Builds a card that wraps all the buttons in the menu.
  final ContextMenuCardBuilder? cardBuilder;

  /// Builds a button for the menu. It will be provided a [ContextMenuButtonConfig] and should return a button
  final ContextMenuButtonBuilder? buttonBuilder;

  /// Builds a vertical or horizontal divider
  final ContextMenuDividerBuilder? dividerBuilder;

  /// Provide styles for the default context menu buttons.
  /// You can ignore this if you're using a custom button builder, or use it if it works for your styling system.
  final ContextMenuButtonStyle? buttonStyle;

  @override
  CodartDesignState createState() => CodartDesignState();

  static CodartDesignState of(BuildContext context) =>
      (context.dependOnInheritedWidgetOfExactType<_InheritedCodartDesign>() as _InheritedCodartDesign).state;
}

class CodartDesignState extends State<CodartDesign> {
  static ContextMenuButtonStyle defaultButtonStyle = const ContextMenuButtonStyle();

  Widget? _currentMenu;
  Size? _prevSize;
  Size _menuSize = Size.zero;
  Offset _mousePos = Offset.zero;

  ContextMenuButtonBuilder? get buttonBuilder => widget.buttonBuilder;

  ContextMenuDividerBuilder? get dividerBuilder => widget.dividerBuilder;

  ContextMenuCardBuilder? get cardBuilder => widget.cardBuilder;

  ContextMenuButtonStyle get buttonStyle => widget.buttonStyle ?? defaultButtonStyle;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        // Remove any open menus when we resize (common behavior, and avoids edge cases / complexity)
        _nullMenuIfOverlayWasResized(constraints);
        // Offset the menu depending on which quadrant of the app we're in, this will make sure it always stays in bounds.
        double dx = 0, dy = 0;
        if (_mousePos.dx > (_prevSize?.width ?? 0) / 2) dx = -_menuSize.width;
        if (_mousePos.dy > (_prevSize?.height ?? 0) / 2) dy = -_menuSize.height;
        // The final menuPos, is mousePos + quadrant offset
        Offset menuPos = _mousePos + Offset(dx, dy);
        Widget? menuToShow = _currentMenu;

        return _InheritedCodartDesign(
          state: this,
          child: Listener(
            onPointerDown: (e) => _mousePos = e.localPosition,
            // Listen for Notifications coming up from the app
            child: Stack(
              children: [
                // Child is the contents of the overlay, usually the entire app.
                widget.child,
                // Show the menu?
                if (menuToShow != null) ...[
                  Positioned.fill(child: Container(color: Colors.transparent)),

                  /// Underlay, blocks all taps to the main content.
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onPanStart: (_) => hide(),
                    onTap: () => hide(),
                    onSecondaryTapDown: (_) => hide(),
                    child: Container(),
                  ),

                  /// Position the menu contents
                  Transform.translate(
                    offset: menuPos,
                    child: Opacity(
                      opacity: _menuSize != Size.zero ? 1 : 0,
                      // Use a measure size widget so we can offset the child properly
                      child: MeasuredSizeWidget(
                        key: ObjectKey(menuToShow),
                        onChange: _handleMenuSizeChanged,
                        child: IntrinsicWidth(child: IntrinsicHeight(child: menuToShow)),
                      ),
                    ),
                  ),
                ]
              ],
            ),
          ),
        );
      },
    );
  }

  /// Sets the current menu to be displayed.
  /// It will not be displayed until next frame, as the child needs to be measured first.
  void show(Widget child) {
    setState(() {
      //This will hide the widget until we can calculate it's size which should take 1 frame
      _menuSize = Size.zero;
      _currentMenu = child;
    });
  }

  /// Hides the current popup if there is one. Fails silently if not.
  void hide() => setState(() => _currentMenu = null);

  /// re-position and rebuild whenever menu size changes
  void _handleMenuSizeChanged(Size value) => setState(() => _menuSize = value);

  /// Auto-close the menu when app size changes.
  /// This is classic context menu behavior at the OS level and we'll follow it because it makes life much easier :D
  void _nullMenuIfOverlayWasResized(BoxConstraints constraints) {
    final size = constraints.biggest;
    bool appWasResized = size != _prevSize;
    if (appWasResized) _currentMenu = null;
    _prevSize = size;
  }
}

/// InheritedWidget boilerplate
class _InheritedCodartDesign extends InheritedWidget {
  const _InheritedCodartDesign({
    Key? key,
    required Widget child,
    required this.state,
  }) : super(key: key, child: child);

  final CodartDesignState state;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
}
