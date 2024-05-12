import 'dart:convert';
import 'dart:developer';

import 'package:flutter_netflix_clone/common/utils.dart';
import 'package:flutter_netflix_clone/models/Movie_recomentaion.dart';
import 'package:flutter_netflix_clone/models/movie_detaile_model.dart';
import 'package:flutter_netflix_clone/models/search_model.dart';
import 'package:flutter_netflix_clone/models/tv_series_modal.dart';
import 'package:flutter_netflix_clone/models/upcoming_model.dart';
import 'package:http/http.dart' as http;

const baseUrl="https://api.themoviedb.org/3/";
var key="?api_key=$apiKey";
late String endPoint;

class ApiServices{

  Future<UpcomingMovieModal> getUpcomingMovies() async {
    endPoint = 'movie/upcoming';
    final url = '$baseUrl$endPoint$key';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      log('success upcomming movie');
      return UpcomingMovieModal.fromJson(jsonDecode(response.body));
    }
    throw Exception('failed to load upcoming movies');
  }


  Future<UpcomingMovieModal> getNowPlaying() async {
    endPoint = 'movie/now_playing';
    final url = '$baseUrl$endPoint$key';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      log('success now playing');
      return UpcomingMovieModal.fromJson(jsonDecode(response.body));
    }
    throw Exception('failed to load now playing movies');
  }

  
  Future<TvSeriesModel> getTopRatedSeries() async {
    endPoint = 'tv/top_rated';
    final url = '$baseUrl$endPoint$key';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      log('success top rated');
      print("............................${response.body}");
      return TvSeriesModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('failed to load top rated tv series');
  }

    Future<MovieRecommendationModel> getPopularMovies() async {
    endPoint = 'movie/popular';
    final url = '$baseUrl$endPoint$key';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      log('success top rated');
      print("............................${response.body}");
      return MovieRecommendationModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('failed to load Popular movies');
  }

  Future<SearchModel> getSearchMovie(String searchText) async {
    endPoint = 'search/movie?query=$searchText';
    final url = '$baseUrl$endPoint';
print('search url is $url');
    final response = await http.get(Uri.parse(url),headers: {
      'Authorization':"Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3NTAyYjhjMDMxYzc5NzkwZmU1YzBiNGY5NGZkNzcwZCIsInN1YiI6IjYzMmMxYjAyYmE0ODAyMDA4MTcyNjM5NSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.N1SoB26LWgsA33c-5X0DT5haVOD4CfWfRhwpDu9eGkc"
    } );
    if (response.statusCode == 200) {
      log('success search');
      print("............................${response.body}");
      return SearchModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('failed to load Search movie');
  }


  Future<MovieDetailModel> getMovieDetail(int movieId) async {
    endPoint = 'movie/$movieId';
    final url = '$baseUrl$endPoint$key';
print('search url is $url');
    final response = await http.get(Uri.parse(url),
    );
    if (response.statusCode == 200) {
      log('success search');
      print("............................${response.body}");
      return MovieDetailModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('failed to load movie Details');
  }

    Future<MovieRecommendationModel> getMovieRecommendations(int movieId) async {
    endPoint = 'movie/$movieId/recommendations';
    final url = '$baseUrl$endPoint$key';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      log('success');
      return MovieRecommendationModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('failed to load  movie details');
  }



}