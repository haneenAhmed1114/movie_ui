import 'package:flutter/material.dart';
import 'package:movie_app/movies/veiw/tabs/browse_tab/browse_tab.dart';
import 'package:movie_app/movies/veiw/tabs/main_page/main_page.dart';
import 'package:movie_app/movies/veiw/tabs/search_tab/search_tab.dart';
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
    BrowseTab(),
    const WatchlistTab(),
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
            selectedItemColor: Colors.amber,
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
            ],
          ),
        ),
      ),
    );
  }
}
