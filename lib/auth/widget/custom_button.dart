import 'package:flutter/material.dart';
import 'package:movie_app/common/app_colors.dart';


class CustomButton extends StatelessWidget {
  const CustomButton(
      {required this.onPressed, required this.text, super.key});
  final void Function()? onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: MediaQuery.of(context).size.width * 0.15,
        left: MediaQuery.of(context).size.width * 0.15,
      ),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
                onPressed: onPressed,
                style:
                    ElevatedButton.styleFrom(backgroundColor:AppColors.goldenColor),
                child: Text(
                  text,
                  style: Theme.of(context).textTheme.titleMedium,
                )),
          ),
        ],
      ),
    );
  }
}