import 'package:flutter/material.dart';
import 'package:movie_app/common/app_assets.dart';
import 'package:movie_app/tabs/main_page/main_page.dart';

class MovieDetailsTab extends StatelessWidget {

  static const String routeName ='movieDetailScreen';
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Container(
          color: Colors.black,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.asset(
                    AppAssets.mainMovieImage,
                    height: 300,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    bottom: 30,
                    left: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Dora and the Lost City of Gold",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "2019 PG-13 · 2h 7m",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 130,
                    left: MediaQuery.of(context).size.width / 2 - 30,
                    child: IconButton(
                      onPressed: () {

                      },
                      icon: Icon(
                        Icons.play_circle_fill,
                        color: Colors.white,
                        size: 60,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "More Like This",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              SizedBox(height: 10),
              // Similar Movies
              SizedBox(
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) => Container(
                    margin: EdgeInsets.only(left: 16),
                    width: 100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        AppAssets.rImage,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Row(children: [
                Text('To go back to home page ',style: TextStyle(color: Colors.white,fontSize:20.0),),
                IconButton(onPressed: () {
                   Navigator.of(context).pushNamed(MainPageTab.routeName);
                }, icon: Icon(Icons.arrow_circle_right_rounded,size: 30,color: Colors.white,))
              ],),

            ],
          ),
        ),
      ),
    );
  }
}
