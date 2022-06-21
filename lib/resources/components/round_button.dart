import 'package:flutter/material.dart';
import 'package:untitled/resources/app_colors.dart';

class RoundButton extends StatelessWidget {
  final String? title;
  final VoidCallback? onPress;
  final bool? isLoading;
  const RoundButton({
    Key? key,
    required this.title,
    this.onPress,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: InkWell(
        onTap: onPress,
        child: Container(
          height: 40,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.lightGreen,
            borderRadius: BorderRadius.circular(16),

          ),
          child: isLoading! ? const Center(child: CircularProgressIndicator(color: Colors.white))
          : Center(child:  Text(title!,
          style: TextStyle(
            color: AppColors.whiteColor,
          ),)),
        ),
      ),
    );
  }
}