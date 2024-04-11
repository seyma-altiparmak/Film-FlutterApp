import 'package:film_flutterapp/data/entity/movies.dart';
import 'package:film_flutterapp/ui/views/details.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:
              const Text("MOVIEHELL 🎞", style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.purple,
        ),
        body: FutureBuilder<List<Movies>>(
          future: LoadMovies(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var movieList = snapshot.data;
              return GridView.builder(
                  itemCount: movieList!.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1.8,
                  ),
                  itemBuilder: (context, i) {
                    var movie = movieList[i];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailsPage(
                                    movie: movie,
                                  )),
                        );
                      },
                      child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset("photos/${movie.image}"),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "${movie.price} TL",
                                  style: TextStyle(fontSize: 24),
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      print("${movie.name} hired");
                                    },
                                    child: const Text("Hire")),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            } else {
              return const Center();
            }
          },
        ));
  }
}
