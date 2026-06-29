import 'package:flutter/material.dart';
import 'package:movie_recommendation/utils/text.dart';
import 'package:movie_recommendation/widgets/trending.dart';
import 'package:movie_recommendation/widgets/toprated.dart';
import 'package:movie_recommendation/widgets/tv.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.green
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List trendingmovies = [];
  List topratedmovies = [];
  List tv = [];

  final String apikey = '067b87b087ce6e093eca30c5211053b7';
  final readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwNjdiODdiMDg3Y2U2ZTA5M2VjYTMwYzUyMTEwNTNiNyIsInN1YiI6IjY1MzUxYWI5OTFmMGVhMDEzODg4OTAyNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.7XNXPH71l8v-q6nB6CZOFebpa5ldwhTi_Duf2twT7ZE';

  @override
  void initState() {
    loadmovies();
    super.initState();
  }

  loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apikey, readaccesstoken),
        logConfig: ConfigLogger(
            showLogs: true,
            showErrorLogs: true
        )
    );

    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topratedresult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvresult = await tmdbWithCustomLogs.v3.tv.getPopular();

    print(trendingresult);
    setState(() {
      trendingmovies = trendingresult['results'];
      topratedmovies = topratedresult['results'];
      tv = tvresult['results'];
    }
    );
    print(trendingmovies);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: modified_text(text:'Flutter Movie App 🎬🍿'),
      ),
      body: ListView(
        children: [
          TopRatedMovies(
            toprated: topratedmovies,
          ),
          TrendingMovies(
              trending: trendingmovies
          ),
          TV(
            tv: tv
          ),
        ],
      ),
    );
  }
}
