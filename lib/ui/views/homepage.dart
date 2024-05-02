import 'package:film_flutterapp/data/entity/movies.dart';
import 'package:film_flutterapp/ui/cubit/homepage_cubit.dart';
import 'package:film_flutterapp/ui/views/details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HomePageCubit>().LoadMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:
              const Text("MOVIEHELL 🎞", style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.purple,
        ),
        body: BlocBuilder<HomePageCubit,List<Movies>>(
          builder: (context, snapshot) {
            if (snapshot.isNotEmpty) {
              return GridView.builder(
                  itemCount: snapshot!.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1.8,
                  ),
                  itemBuilder: (context, i) {
                    var movie = snapshot[i];
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
