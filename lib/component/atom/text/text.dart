part of '../../../codartdesign.dart';

abstract class BaseText extends StatelessWidget {
  const BaseText(
    this.text, {
    this.color,
    this.weight,
    this.decoration,
    super.key,
  });

  final String? text;
  final Color? color;
  final FontWeight? weight;
  final TextDecoration? decoration;

  Widget _build(BuildContext context, TextStyle style) {
    return Transform(
      transform: Matrix4.identity()..translate(0.0, -1.0),
      child: Text(
        text ?? '',
        style: style.copyWith(
          color: color ?? CodartColor.text.getColor(context),
          fontWeight: weight,
          decoration: decoration,
        ),
      ),
    );
  }
}

class TitleXXL extends BaseText {
  const TitleXXL(
    super.text, {
    super.color,
    super.weight,
    super.decoration,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return _build(context, titleXXL);
  }
}

class TitleXL extends BaseText {
  const TitleXL(
    super.text, {
    super.color,
    super.weight,
    super.decoration,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return _build(context, titleXL);
  }
}

class TitleL extends BaseText {
  const TitleL(
    super.text, {
    super.color,
    super.weight,
    super.decoration,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return _build(context, titleL);
  }
}

class TitleM extends BaseText {
  const TitleM(
    super.text, {
    super.color,
    super.weight,
    super.decoration,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return _build(context, titleM);
  }
}

class TitleS extends BaseText {
  const TitleS(
    super.text, {
    super.color,
    super.weight,
    super.decoration,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return _build(context, titleS);
  }
}

class TitleXS extends BaseText {
  const TitleXS(
    super.text, {
    super.color,
    super.weight,
    super.decoration,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return _build(context, titleXS);
  }
}

class TextL extends BaseText {
  const TextL(
    super.text, {
    super.color,
    super.weight,
    super.decoration,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return _build(context, textL);
  }
}

class TextM extends BaseText {
  const TextM(
    super.text, {
    super.color,
    super.weight,
    super.decoration,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return _build(context, textM);
  }
}

class TextS extends BaseText {
  const TextS(
    super.text, {
    super.color,
    super.weight,
    super.decoration,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return _build(context, textS);
  }
}

class TextXS extends BaseText {
  const TextXS(
    super.text, {
    super.color,
    super.weight,
    super.decoration,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return _build(context, textXS);
  }
}

class StyledText extends BaseText {
  const StyledText(
    super.text,
    this.style, {
    super.color,
    super.weight,
    super.decoration,
    super.key,
  });

  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return _build(context, style);
  }
}
