import 'package:coding_task/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final Widget? icon;
  const CustomButton({
    super.key,
    this.onPressed,
    required this.text,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      color: Colors.grey.shade300,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomText(text: text),
          if (icon != null) const Gap(10),
          if (icon != null) icon!
        ],
      ),
    );
  }
}
