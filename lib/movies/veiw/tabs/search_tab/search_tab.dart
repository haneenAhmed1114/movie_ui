import 'package:flutter/material.dart';
import 'package:movie_app/common/app_colors.dart';
import 'package:movie_app/movies/veiw/tabs/search_tab/search_screen_view.dart';

class SearchTab extends StatelessWidget {
  const SearchTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,        
        body: Column(children: [
           const Padding(
             padding: EdgeInsets.all(10.0),
             child: Text("Search Movies",style: TextStyle(color: Colors.white,fontSize: 20),),
           ),
             Center(
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
        ],)
      
      ),
    );
  }
}