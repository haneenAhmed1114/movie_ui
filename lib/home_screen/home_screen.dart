import 'package:flutter/material.dart';
import 'package:movie_app/common/app_colors.dart';
import 'package:movie_app/movies/veiw/tabs/browse_tab/browse_tab.dart';
import 'package:movie_app/movies/veiw/tabs/main_page/main_page.dart';
import 'package:movie_app/movies/veiw/tabs/search_tab/search_tab.dart';
import 'package:movie_app/movies/veiw/tabs/setting_tab/setting_tab.dart';
import 'package:movie_app/movies/veiw/tabs/watchlist_tab/watchlist_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'homeScreen';

  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> tabs = [
    const MainPageTab(),
    const SearchTab(),
   const BrowseTab(),
    const WatchlistTab(),
    const SettingTab()
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: tabs[currentIndex],

        // Bottom Navigation Bar
        bottomNavigationBar: Theme(
          data: ThemeData(canvasColor: Colors.black),
          child: BottomNavigationBar(
            unselectedItemColor: Colors.white70,
            selectedItemColor: AppColors.goldenColor,
            showUnselectedLabels: true,
            currentIndex: currentIndex,
            onTap: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: "Search",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.movie),
                label: "Browse",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.bookmark),
                label: "WatchList",
              ),
               BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: "settings",
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
