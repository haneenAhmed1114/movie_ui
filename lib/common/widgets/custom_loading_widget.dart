import 'package:flutter/material.dart';
import 'package:movie_app/common/app_colors.dart';

class CustomLoadingWidget extends StatelessWidget {
  const CustomLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(color: AppColors.goldenColor,),
    );
  }
}