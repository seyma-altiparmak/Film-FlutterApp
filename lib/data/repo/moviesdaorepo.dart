import 'package:film_flutterapp/data/entity/movies.dart';
import 'package:film_flutterapp/sqlite/databasehelper.dart';

class MoviesDAO_Repository{
  Future<List<Movies>> LoadMovies() async {
    var db = await DatabaseHelper.accessDatabase();
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM filmler");

    return List.generate(maps.length, (i) {
      var row = maps[i];
      return Movies(id: row["id"], name: row["name"], image: row["image"], price: row["image"]);
    });

  }
}