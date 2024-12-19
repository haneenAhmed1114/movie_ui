import 'package:flutter/material.dart';
import 'package:movie_app/api/api_servcies.dart';
import 'package:movie_app/movies/model_view/browse_name_model.dart';
import 'package:movie_app/movies/veiw/tabs/browse_tab/browse_card.dart';
import 'package:movie_app/movies/veiw/tabs/browse_tab/genre_browse_screen.dart';


class BrowseTab extends StatelessWidget {
  const BrowseTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
     const Padding(
        padding:  EdgeInsets.all(10.0),
        child:   Text(
            'Browse Screen',
            style: TextStyle(color: Colors.white,fontSize: 20),
          ),
      ),
        FutureBuilder(
            future: ApiServices.getBrowseNameMovies(),
            builder: (context, snapshot) {
              BrowseNameModel? topRatedMovie = snapshot.data;
              List<Genres> genres = topRatedMovie?.genres ?? [];
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        childAspectRatio: MediaQuery.of(context).size.width /
                            (MediaQuery.of(context).size.height / 3),
                      ),
                      itemCount: genres.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                                GenreBrowseScreen.routeName,
                                arguments: genres[index]);
                          },
                          child: BrowseCard(
                            title: genres[index].name,
                          ),
                        );
                      }),
                ),
              );
            })
      ],
    );
  }
}