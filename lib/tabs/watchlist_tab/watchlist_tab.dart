import 'package:flutter/material.dart';
import 'package:movie_app/common/app_assets.dart';
import 'package:movie_app/tabs/watchlist_tab/widget/custom_watch_card.dart';

class WatchlistTab extends StatelessWidget {
  const WatchlistTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Watchlist',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
        ),
        backgroundColor: Colors.black,
        body: ListView.separated(
            separatorBuilder: (context, index) => const Divider(
                  color: Colors.grey,
                  thickness: 0.5,
                  indent: 16,
                  endIndent: 16,
                ),
            itemCount: 10,
            itemBuilder: (context, index) {
              return const CustomWatchCard(
                  assetName: AppAssets.sImage,
                  title: 'Alita Battle Angel',
                  year: '2018',
                  cast: 'Rosa Salazar, Christoph Waltz');
            }));
  }
}
