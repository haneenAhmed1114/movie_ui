import 'package:flutter/material.dart';
import 'package:movie_app/home_screen/home_screen.dart';
import 'package:movie_app/splash/splash_screen.dart';
import 'package:movie_app/tabs/main_page/main_page.dart';
import 'package:movie_app/tabs/main_page/movie_details_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        SplashScreen.routeName: (_) => const SplashScreen(),
        HomeScreen.routeName: (_) => const HomeScreen(),
        MainPageTab.routeName: (_) => const MainPageTab(),
       MovieDetailsScreen.routeName:(_)=>const MovieDetailsScreen()
      },
      
    );
  }
}
