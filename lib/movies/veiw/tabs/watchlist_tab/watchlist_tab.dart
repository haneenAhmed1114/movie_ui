import 'package:flutter/material.dart';
import 'package:movie_app/common/widgets/custom_loading_widget.dart';
import 'package:movie_app/movies/model_view/movies_model_firebase.dart';
import 'package:movie_app/movies/veiw/tabs/watchlist_tab/widget/custom_watch_card.dart';
import 'package:movie_app/provider/movie_provider.dart';
import 'package:provider/provider.dart';

class WatchlistTab extends StatefulWidget {
  const WatchlistTab({super.key});

  @override
  State<WatchlistTab> createState() => _WatchlistTabState();
}

class _WatchlistTabState extends State<WatchlistTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       const Padding(
          padding:  EdgeInsets.all(10.0),
          child:  Text(
            'Watch List',
            style: TextStyle(color: Colors.white,fontSize: 20),
          ),
        ),
        StreamBuilder<List<MoviesModelFirebase>?>(
            stream: Provider.of<MovieProvider>(context, listen: false)
                .getMovies(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Expanded(
                  child: CustomLoadingWidget(),
                );
              } else {
                var data = snapshot.data;
    
                if (data == null || data.isEmpty) {
                  return const Expanded(
                    child: Center(
                      child: Text(
                       ' No Watch List',
                        style: TextStyle(color: Colors.white)
                      ),
                    ),
                  );
                }
                return Expanded(
                  child: ListView.separated(
                    itemBuilder: (_, index) {
                      return WatchCard(
                        movieModel: data[index],
                      );
                    },
                    itemCount: data.length,
                    separatorBuilder: (_, index) {
                      return const Divider();
                    },
                  ),
                );
              }
            })
      ],
    );
  }
}