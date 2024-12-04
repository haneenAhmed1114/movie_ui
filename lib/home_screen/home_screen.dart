import 'package:flutter/material.dart';
import 'package:movie_app/common/app_assets.dart';
import 'package:movie_app/tabs/browse_tab/browse_tab.dart';
import 'package:movie_app/tabs/main_page/main_page.dart';
import 'package:movie_app/tabs/main_page/movie_detail.dart';
import 'package:movie_app/tabs/search_tab/search_tab.dart';
import 'package:movie_app/tabs/watchlist_tab/watchlist_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName ='homeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int currentIndex = 0 ;
  List<Widget> tabs = [
    MainPageTab(),
    SearchTab(),
    BrowseTab(),
    WatchlistTab(),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Movie',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: tabs[currentIndex],

      // Bottom Navigation Bar
      bottomNavigationBar: Theme(
        data: ThemeData(canvasColor: Colors.black),
        child: BottomNavigationBar(
          unselectedItemColor: Colors.white70,
          selectedItemColor: Colors.amber,
          showUnselectedLabels: true,
          currentIndex: currentIndex ,
          onTap: (value) {
            setState(() {
              currentIndex = value ;
            });
          },
          items: [
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
    );
  }
}

