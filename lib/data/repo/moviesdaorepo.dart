import 'package:film_flutterapp/data/entity/movies.dart';

class MoviesDAO_Repository{
  Future<List<Movies>> LoadMovies() async {
    var movieList = <Movies>[];
    var f1 = Movies(id: 1, name: "Django", image: "django.png", price: 24);
    var f2 = Movies(
        id: 2, name: "Interstellar", image: "interstellar.png", price: 32);
    var f3 =
    Movies(id: 3, name: "Inception", image: "inception.png", price: 16);
    var f4 = Movies(
        id: 4,
        name: "The Hateful Eight",
        image: "thehatefuleight.png",
        price: 28);
    var f5 =
    Movies(id: 5, name: "The Pianist", image: "thepianist.png", price: 18);
    var f6 =
    Movies(id: 6, name: "Anadoluda", image: "anadoluda.png", price: 10);
    movieList.add(f1);
    movieList.add(f2);
    movieList.add(f3);
    movieList.add(f4);
    movieList.add(f5);
    movieList.add(f6);
    return movieList;
  }
}