import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_netflix_clone/common/utils.dart';
import 'package:flutter_netflix_clone/models/upcoming_model.dart';

class MovieCard extends StatelessWidget {
  final Future<UpcomingMovieModal> future;

  final String headLineText;
  const MovieCard(
      {super.key, required this.future, required this.headLineText});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data?.results;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  headLineText,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                 child: ListView.builder(
  itemCount: data!.length,
  scrollDirection: Axis.horizontal,
  shrinkWrap: true,
  itemBuilder: (context, index) {
    // Reverse the list order
    final reversedIndex = data.length - 1 - index;

    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: CachedNetworkImage(
        imageUrl: "$imgUrl${data[reversedIndex].posterPath}",
      ),
    );
  },
),

                ),
              ],
            );
          } else {
            return const SizedBox.shrink();
          }
        });
  }
}
