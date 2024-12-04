import 'package:flutter/material.dart';
import 'package:movie_app/common/app_assets.dart';


class MovieDetailsScreen extends StatelessWidget {
  static const String routeName ='movieDetailsScreen';

  const MovieDetailsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Text('Movie Details',style: TextStyle(color: Colors.white),),
        ),
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.asset(
                    AppAssets.mainMovieImage,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dora and the Lost City of Gold',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '2019 | PG | 1h 42m',
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Having spent most of her life exploring the jungle, nothing could prepare Dora for the most dangerous adventure yet — high school.',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Cast',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Isabela Moner, Eugenio Derbez, Michael Peña',
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Rating',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 20),
                        SizedBox(width: 4),
                        Text(
                          '7.7',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
