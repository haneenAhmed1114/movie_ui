import 'package:flutter/material.dart';
import 'package:movie_app/common/app_assets.dart';
import 'package:movie_app/home_screen/home_screen.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = 'splashScreen';
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {

    Future.delayed(Duration(seconds: 1),() => HomeScreen.routeName,);
    return SizedBox(
      height: double.infinity,
      child: Scaffold(
        body: Image(
          image: AssetImage(
            AppAssets.splashScreen,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
