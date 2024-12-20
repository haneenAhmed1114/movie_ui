import 'package:flutter/material.dart';
import 'package:movie_app/common/app_assets.dart';

class BrowseCard extends StatelessWidget {
  const BrowseCard({super.key, required this.title});

  final String? title;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          image: DecorationImage(
              image: AssetImage(AppAssets.movieBrowse), fit: BoxFit.fill)),
      child: Text(
        title ?? '',
        style:const TextStyle(color: Colors.white,fontSize: 20),
      ),
    );
  }
}