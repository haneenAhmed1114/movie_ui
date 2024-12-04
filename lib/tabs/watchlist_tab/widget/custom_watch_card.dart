import 'package:flutter/material.dart';

class CustomWatchCard extends StatelessWidget {
  const CustomWatchCard({super.key, required this.assetName, required this.title, required this.year, required this.cast});
  final String assetName;
  final String title;
  final String year;
  final String cast;

  @override
  Widget build(BuildContext context) {
    return  Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
            child: Row(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 100,
                      width: 70,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(assetName),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    // Positioned(
                    //   top: 4,
                    //   left: 4,
                    //   child: Container(
                    //     decoration: const BoxDecoration(
                    //       color: Colors.amber,
                    //       shape: BoxShape.circle,
                    //     ),
                    //     child: const Icon(
                    //       Icons.check,
                    //       size: 16,
                    //       color: Colors.black,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                       title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                       year,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                       cast,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                )
              ]
            )
    );
  }
}