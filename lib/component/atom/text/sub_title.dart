part of '../../../codartdesign.dart';

class SubTitle extends StatelessWidget {
  const SubTitle(
    this.data, {
    super.key,
  });

  final String? data;

  @override
  Widget build(BuildContext context) {
    return Text(
      data ?? '',
      style: titleXS.copyWith(color: CodartColor.text.getColor(context)),
    );
  }
}
