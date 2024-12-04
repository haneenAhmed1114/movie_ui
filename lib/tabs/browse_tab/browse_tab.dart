import 'package:flutter/material.dart';
import 'package:movie_app/common/app_assets.dart';

class BrowseTab extends StatelessWidget {
  final List<String> categories = [
    'Action',
    'Drama',
    'Comedy',
    'Thriller',
    'Horror',
    'Sci-Fi',
    'Romance',
    'Adventure'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Browse Category',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 158 / 90,
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.grey[800],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Stack(
                        children: [
                          Image.asset(AppAssets.rImage,fit: BoxFit.cover,),
                          Text(
                            categories[index],
                            style: TextStyle(fontSize: 20,color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

