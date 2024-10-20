import 'package:flutter/widgets.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight? fontWeight;
  const CustomText(
      {super.key, required this.text, this.fontSize = 16, this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
