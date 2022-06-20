import 'package:flutter/material.dart';
import 'package:untitled/resources/app_colors.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: AppColors.lightGreen,
        borderRadius: BorderRadius.circular(16),

      ),
      child: const Text('click'),
    );
  }
}