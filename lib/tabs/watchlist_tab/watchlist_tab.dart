import 'package:flutter/material.dart';
import 'package:movie_app/common/reusable_card_watchlist.dart';

class WatchlistTab extends StatelessWidget {
  const WatchlistTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('WatchList',style: TextStyle(color: Colors.white,fontSize: 30.0),),
        Expanded(child: ListView.builder(itemBuilder: (context, index) => WatchlistItem(),itemCount: 10,)),
      ],
    );
  }
}

