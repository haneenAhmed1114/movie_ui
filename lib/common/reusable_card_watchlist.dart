import 'package:flutter/material.dart';
import 'package:movie_app/common/app_assets.dart';

class WatchlistItem extends StatelessWidget {
  final List<Map<String, String>> movies = [
    {
      'title': 'Alita Battle Angel',
      'year': '2019',
      'cast': 'Rosa Salazar, Christoph Waltz',
      'image': AppAssets.sImage,
    },

  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[900],
      margin: EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(10),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
           AppAssets.rImage,
            fit: BoxFit.cover,
            width: 100,
            height: 120,
          ),
        ),
        title: Text(
          'Alita Battle Angel',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
             '2019',
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            Text(
              'Rosa Salazar, Christoph Waltz',
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}

