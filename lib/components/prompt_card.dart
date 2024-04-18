import 'package:flutter/material.dart';
import 'package:test_flutter_mobile_project/app_colors.dart';
import 'package:test_flutter_mobile_project/app_styles.dart';

class PromptCard extends StatelessWidget {
  final String prompt;
  final Function(String prompt) onPromptSelected;

  const PromptCard(
      {super.key, required this.prompt, required this.onPromptSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.gradient1,
          width: 1,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(AppStyles.borderRadius),
      ),
      padding: const EdgeInsets.all(10),
      child: ListTile(
        titleAlignment: ListTileTitleAlignment.center,
        title: Text(
          prompt,
          style: const TextStyle(color: AppColors.gradient1),
        ),
        onTap: () {
          onPromptSelected(prompt);
        },
      ),
    );
  }
}
