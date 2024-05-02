import 'package:film_flutterapp/data/entity/movies.dart';
import 'package:film_flutterapp/data/repo/moviesdaorepo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageCubit extends Cubit<List<Movies>>{
  HomePageCubit():super(<Movies>[]);

  var mrepo = MoviesDAO_Repository();

  Future<void> LoadMovies() async {
    var list = await mrepo.LoadMovies();
    emit(list);
  }

}