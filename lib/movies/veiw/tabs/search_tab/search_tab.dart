import 'package:flutter/material.dart';
import 'package:movie_app/common/app_colors.dart';
import 'package:movie_app/movies/veiw/tabs/search_tab/search_screen_view.dart';

class SearchTab extends StatelessWidget {
  const SearchTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Search Movies",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: ElevatedButton(
          style: const ButtonStyle(backgroundColor: WidgetStatePropertyAll(AppColors.goldenColor)),
          onPressed: () {
            showSearch(
              context: context,
              delegate: SearchScreenView(),
            );
          },
          child: const Text("Search Movies",style: TextStyle(color: Colors.black),),
        ),
      ),
    );
  }
}