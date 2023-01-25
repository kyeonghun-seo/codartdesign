part of '../../../codartdesign.dart';

class BodyText extends StatelessWidget {
  const BodyText(
    this.data, {
    super.key,
  });

  final String? data;

  @override
  Widget build(BuildContext context) {
    return Text(
      data ?? '',
      style: textM.copyWith(color: context.textColor),
    );
  }
}
