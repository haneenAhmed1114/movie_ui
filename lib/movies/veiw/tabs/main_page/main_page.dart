import 'package:flutter/material.dart';
import 'package:movie_app/common/app_assets.dart';
import 'package:movie_app/movies/model_view/popular_movies_model.dart';
import 'package:movie_app/movies/veiw/tabs/main_page/movie_details_screen.dart';

class MainPageTab extends StatelessWidget {
  static const String routeName = 'mainPageScreen';
  const MainPageTab({super.key, this.results});
 final Results ? results;

  @override
  Widget build(BuildContext context) {
    print(results?.title??'hhhh');
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.network(
                  results?.posterPath??AppAssets.mainMovieImage,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                 Positioned(
                  bottom: 20,
                  left: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        results?.title??'',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        results?.releaseDate??'',
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                     

                    ],
                  ),
                ),
                Positioned(
                  top: 80,
                  left: MediaQuery.of(context).size.width / 2 - 30,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(MovieDetailsScreen.routeName);
                    },
                    icon: const Icon(
                      Icons.play_circle_fill,
                      color: Colors.white,
                      size: 60,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
    
    
            const Padding(
              padding:  EdgeInsets.all(8.0),
              child: Text(
                "New Releases",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            
            const SizedBox(height: 10),
    
            SizedBox(
              height: 170,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) => Container(
                  color: Colors.grey[800],
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Image.network(
                          AppAssets.sImage,
                          height: 150,
                          width: 140,
                          alignment: Alignment.center,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
             const Padding(
              padding:  EdgeInsets.all(8.0),
              child: Text(
                "Recomended",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 170,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) => Container(
                  color: Colors.grey[800],
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Image.network(
                          AppAssets.rImage,
                          height: 150,
                          width: 140,
                          alignment: Alignment.center,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Text(
                        "Movie ${index + 1}",
                        style:const TextStyle(color: Colors.white, fontSize: 12),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    
  }
}
