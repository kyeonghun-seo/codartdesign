part of '../../../codartdesign.dart';

abstract class Typography extends StatelessWidget {
  const Typography(
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

  Widget _buildText(BuildContext context, TextStyle style) {
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

class TextM extends Typography {
  const TextM(
    super.text, {
    super.color,
    super.weight,
    super.decoration,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return _buildText(context, textM);
  }
}

class TextS extends Typography {
  const TextS(
    super.text, {
    super.color,
    super.weight,
    super.decoration,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return _buildText(context, textS);
  }
}

class TextXS extends Typography {
  const TextXS(
    super.text, {
    super.color,
    super.weight,
    super.decoration,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return _buildText(context, textXS);
  }
}

class StyledText extends Typography {
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
    return _buildText(context, style);
  }
}
