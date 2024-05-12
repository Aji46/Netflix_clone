import 'package:flutter/material.dart';
import 'package:flutter_netflix_clone/Screens/search_screen.dart';
import 'package:flutter_netflix_clone/common/utils.dart';
import 'package:flutter_netflix_clone/models/upcoming_model.dart';
import 'package:flutter_netflix_clone/services/api_services.dart';
import 'package:flutter_netflix_clone/widgets/coustom_cursal.dart';

import '../models/tv_series_modal.dart';
import '../widgets/movie_card.dart';

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _HomeState();
}

class _HomeState extends State<homescreen> {
  late Future<UpcomingMovieModal> upcomingFuture;
  late Future<UpcomingMovieModal> nowPlayingFuture;
  late Future<TvSeriesModel> topRatedShows;

  ApiServices apiServices=ApiServices();


@override
  void initState(){
  
       upcomingFuture=apiServices.getUpcomingMovies();
       nowPlayingFuture=apiServices.getNowPlaying();
       topRatedShows = apiServices.getTopRatedSeries();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        title: Image.asset("assets/netflix logo.png",
      height: 50,
      width: 120,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right:20.0),
          child: InkWell(
            onTap:(){
                  Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SearchScreen(),),);
            },
            child: const Icon(Icons.search,
            size: 30,
            color:Colors.white ),),
        ),

         ClipRRect(
          borderRadius:BorderRadius.circular(6),
         child: Container(
          color: Colors.blue,
          height: 27,
          width: 27,
         ),
         ),const SizedBox(width: 20,) 
      ],
       
      ),
      body: SingleChildScrollView(
        child: Column(
          children:[
    FutureBuilder<TvSeriesModel>(
              future: topRatedShows,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return CustomCarouselSlider(data: snapshot.data!);
                }
                return const SizedBox.shrink( );
              },
            ),
   
            const SizedBox(height: 20,),
               SizedBox(
              height: 220,
              
              child: MovieCardWidget(

                future: upcomingFuture,
                headLineText: 'Upcoming Movies',
              ),
            ),

               const SizedBox(
              height: 20,
            ),
              SizedBox(
              height: 220,
              child: MovieCardWidget(
                future: nowPlayingFuture,
                headLineText: 'Now Playing',
              ),
            ),
             
          ],
        ),
      ),
    );
  }
}
