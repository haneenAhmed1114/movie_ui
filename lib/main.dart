import 'package:flutter/material.dart';
import 'package:movie_app/home_screen/home_screen.dart';
import 'package:movie_app/splash/splash_screen.dart';
import 'package:movie_app/tabs/main_page/main_page.dart';
import 'package:movie_app/tabs/main_page/movie_detail.dart';

void main()
{
  runApp(MyApp());
}
class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes:{
        SplashScreen.routeName : (_)=> SplashScreen(),
        HomeScreen.routeName : (_)=> HomeScreen(),
        MainPageTab.routeName : (_)=> MainPageTab(),
        MovieDetailsTab.routeName : (_)=> MovieDetailsTab(),
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}