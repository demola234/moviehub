import 'package:flutter/material.dart';
import 'package:moviehub/core/bloc/get_movie_bloc.dart';
import 'package:moviehub/extentions/customs_errors.dart';
import 'package:moviehub/extentions/helper.dart';
import 'package:moviehub/model/movie_response.dart';
import 'package:moviehub/model/movies.dart';
import 'package:page_indicator/page_indicator.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    moviesBloc..getMovie();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<MovieResponse>(
        stream: moviesBloc.subject.stream,
        builder: (context, AsyncSnapshot<MovieResponse> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.error.length > 0) {
              return _buildErrorWidget(snapshot.data!.error);
            }
            return _buildMovieWidget(snapshot.requireData);
          } else if (snapshot.hasError) {
            return _buildErrorWidget(snapshot.data!.error);
          } else {
            return _buildLoading();
          }
        });
  }

  Widget _buildLoading() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 25.0,
            width: 25.0,
            child: CircularProgressIndicator(),
          )
        ],
      ),
    );
  }

  Widget _buildErrorWidget(String error) {
    return  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              child: Text("An Error Occured", style: TextStyle(color: Colors.white, fontSize: 10, decoration: TextDecoration.none),),
            )
          ],
        
      
            );
  }

  Widget _buildMovieWidget(MovieResponse response) {
    List<Movies> movies = response.movies;

    if (movies.length == 0) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 25.0,
              width: 25.0,
              child: Text("No Movie Found"),
            )
          ],
        ),
      );
    } else {
      return Container(
        height: 220,
        child: PageIndicatorContainer(
            align: IndicatorAlign.bottom,
            indicatorSpace: 8.0,
            padding: EdgeInsets.all(8.0),
            indicatorColor: Colors.grey,
            indicatorSelectorColor: Colors.blue,
            length: movies.take(5).length,
            child: PageView.builder(
                itemCount: movies.take(5).length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return SafeArea(
                    child: Container(
                      child: Stack(
                        children: [
                          Container(
                            width: fullWidth(context),
                            decoration: BoxDecoration(
                                // shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "https://image.tmdb.org/t/p/original/" +
                                            movies[index].backPoster))),
                          ),
                          
                        ],
                      ),
                    ),
                  );
                })),
      );
    }
  }

  showErrorDialog(message) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return Container(
            height: 200, 
            width: 400,
          );
        });
  }
}
