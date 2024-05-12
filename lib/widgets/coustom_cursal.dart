import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netflix_clone/Screens/movie_detail_screen.dart';
import 'package:flutter_netflix_clone/models/tv_series_modal.dart';
import 'package:flutter_netflix_clone/widgets/leading_card.dart';

import '../common/utils.dart';

class CustomCarouselSlider extends StatelessWidget {
  const CustomCarouselSlider({
    super.key,
    required this.data,
  });
  final TvSeriesModel data;

  @override
Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var carouselOptions = CarouselOptions(
      height: (size.height * 0.33 < 300) ? 300 : size.height * 0.33,
      aspectRatio: 16 / 9,
      viewportFraction: 0.9,
      initialPage: 0,
      enableInfiniteScroll: true,
      reverse: false,
      autoPlay: true,
      autoPlayInterval: const Duration(seconds: 3),
      autoPlayAnimationDuration: const Duration(milliseconds: 800),
      autoPlayCurve: Curves.fastOutSlowIn,
      enlargeCenterPage: true,
      scrollDirection: Axis.horizontal,
    );
       return SizedBox(
      width: size.width,
      height: (size.height * 0.33 < 300) ? 300 : size.height * 0.33,
      child: CarouselSlider.builder(
          itemCount: data.results.length,
          itemBuilder: (BuildContext context, int index, int realIndex) {
            var url = data.results[index].backdropPath.toString();

            return GestureDetector(
            onTap: () {
                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MovieDetailScreen(
                                      movieId:data.results[index].id,
                                    ),
                                  ),
                                );
            },
            child: LandingCard(
              image: CachedNetworkImageProvider("$imgUrl$url"),
              name: data.results[index].name.toString(),
            ),
          );
          },
          options: carouselOptions,
          ),
    );
  }
}
