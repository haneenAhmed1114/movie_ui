import 'package:flutter/material.dart';
import 'package:movie_app/auth/login.dart';
import 'package:movie_app/common/app_assets.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = '/';
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3),
        () => Navigator.of(context).pushNamed(Login.routeName));
    return Scaffold(
        backgroundColor: Colors.black,
        body: Image.asset(
          AppAssets.splashIcon,
          width: double.infinity,
          height: double.infinity,
        ));
  }
}
