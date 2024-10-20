import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'widgets.dart';

class CustomDialogueLayout extends StatelessWidget {
  final String title;
  final String message;
  final String buttonText;
  final void Function()? onPressed;
  const CustomDialogueLayout(
      {super.key,
      required this.message,
      required this.title,
      required this.buttonText,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Gap(20),
        CustomText(
          text: title,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        const Gap(20),
        CustomText(text: message),
        const Gap(20),
        CustomButton(
          text: buttonText,
          onPressed: onPressed,
          icon: const Icon(
            Icons.arrow_forward,
            size: 14,
          ),
        ),
      ],
    );
  }
}
