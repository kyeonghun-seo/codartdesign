part of '../codartdesign.dart';

const transparent = Color(0x00000000);
const white = Color(0xffFFFFFF);
const gray100 = Color(0xffFCFCFC);
const gray150 = Color(0xffF5F5F5);
const gray200 = Color(0xffEFEFEF);
const gray250 = Color(0xffE8E8E8);
const gray300 = Color(0xffDFDFDF);
const gray350 = Color(0xffC8C8C8);
const gray400 = Color(0xffB7B7B7);
const gray500 = Color(0xff949494);
const gray600 = Color(0xff777777);
const gray650 = Color(0xff616161);
const gray700 = Color(0xff555555);
const gray750 = Color(0xff3F3F3F);
const gray770 = Color(0xff383838);
const gray800 = Color(0xff2A2A2A);
const gray850 = Color(0xff1F1F1F);
const gray870 = Color(0xff1A1A1A);
const gray900 = Color(0xff111111);
const black = Color(0xff000000);

const green400 = Color(0xff06C755);

const red400 = Color(0xffFF334B);

const blue400 = Color(0xff96B2FF);
const blue500 = Color(0xff638DFF);
const blue600 = Color(0xff4270ED);
const blue700 = Color(0xff2F59CC);

const navy400 = Color(0xffC8CFDC);
const navy500 = Color(0xff98A0B3);
const navy600 = Color(0xff707991);
const navy700 = Color(0xff464F69);
const navy800 = Color(0xff323B54);
const navy850 = Color(0xff262F4A);
const navy900 = Color(0xff202A43);

class CodartColor {
  static SemanticColor main = SemanticColor(lightColor: green400, darkColor: green400);

  static SemanticColor background = SemanticColor(lightColor: white, darkColor: gray900);
  static SemanticColor secondaryBackground = SemanticColor(lightColor: gray100, darkColor: gray870);
  static SemanticColor tertiaryBackground = SemanticColor(lightColor: gray200, darkColor: gray800);

  static SemanticColor primaryDimmed =
      SemanticColor(lightColor: black.withOpacity(0.85), darkColor: black.withOpacity(0.85));
  static SemanticColor secondaryDimmed =
      SemanticColor(lightColor: black.withOpacity(0.70), darkColor: black.withOpacity(0.70));
  static SemanticColor tertiaryDimmed =
      SemanticColor(lightColor: black.withOpacity(0.30), darkColor: black.withOpacity(0.30));

  static SemanticColor text = SemanticColor(lightColor: black, darkColor: white);
  static SemanticColor primaryText = SemanticColor(lightColor: gray900, darkColor: white);
  static SemanticColor secondaryText = SemanticColor(lightColor: gray600, darkColor: gray500);
  static SemanticColor tertiaryText = SemanticColor(lightColor: gray350, darkColor: gray750);

  static SemanticColor divider = SemanticColor(lightColor: gray150, darkColor: gray850);
  static SemanticColor disable = SemanticColor(lightColor: gray300, darkColor: gray770);

  static SemanticColor positive = SemanticColor(lightColor: green400, darkColor: green400);
  static SemanticColor negative = SemanticColor(lightColor: red400, darkColor: red400);
  static SemanticColor link = SemanticColor(lightColor: blue600, darkColor: blue600);
}

class SemanticColor {
  SemanticColor({
    required this.lightColor,
    required this.darkColor,
  });

  final Color lightColor;
  final Color darkColor;

  Color getColor(BuildContext context) => context.isDarkMode ? darkColor : lightColor;
}

extension ColorX on Color {
  Color get highlighted {
    final hsvColor = HSVColor.fromColor(this);
    if (hsvColor.value <= 0.32) {
      return hsvColor.withValue(hsvColor.value + 0.45).toColor();
    } else if (hsvColor.value <= 0.86) {
      return hsvColor.withValue(hsvColor.value - 0.20).toColor();
    } else {
      return hsvColor.withValue(hsvColor.value - 0.35).toColor();
    }
  }

  Color get hover {
    if (this == white) {
      return gray200.withOpacity(0.70);
    } else {
      return withOpacity(0.70);
    }
  }

  Color get pressed {
    if (this == white) {
      return gray200.withOpacity(0.30);
    } else {
      return withOpacity(0.30);
    }
  }

  Color get disabled {
    if (this == white) {
      return gray900.withOpacity(0.40);
    } else {
      return withOpacity(0.40);
    }
  }
}

extension ContextX on BuildContext {
  Color get mainColor => CodartColor.main.getColor(this);
  Color get backgroundColor => CodartColor.background.getColor(this);
  Color get textColor => CodartColor.text.getColor(this);
}
