import 'package:flutter/material.dart';
import 'package:movie_app/auth/login.dart';
import 'package:movie_app/auth/sign_up.dart';
import 'package:movie_app/home_screen/home_screen.dart';
import 'package:movie_app/movies/veiw/tabs/browse_tab/genre_browse_screen.dart';
import 'package:movie_app/movies/veiw/tabs/main_page/main_page.dart';
import 'package:movie_app/movies/veiw/tabs/main_page/movie_details_screen.dart';
import 'package:movie_app/movies/veiw/tabs/setting_tab/setting_tab.dart';
import 'package:movie_app/provider/movie_provider.dart';
import 'package:movie_app/provider/user_provider.dart';
import 'package:movie_app/splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(MultiProvider( providers: [
    ChangeNotifierProvider<UserProvider>(create: (_)=>UserProvider(),

    ),
     ChangeNotifierProvider<MovieProvider>(create: (_)=>MovieProvider()),
  ],
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        SignUp.routeName: (_) => const SignUp(),
        Login.routeName: (_) => const Login(),
        SplashScreen.routeName: (_) => const SplashScreen(),
        HomeScreen.routeName: (_) => const HomeScreen(),
        MainPageTab.routeName: (_) => const MainPageTab(),
        MovieDetailsScreen.routeName: (_) => const MovieDetailsScreen(),
        SettingTab.routeName:(_)=>const SettingTab(),
        GenreBrowseScreen.routeName:(_)=>const GenreBrowseScreen(),
       
      },
    
    );
  }
}
