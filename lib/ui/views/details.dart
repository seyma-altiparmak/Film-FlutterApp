import 'package:film_flutterapp/data/entity/movies.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  Movies movie;


  DetailsPage({required this.movie});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${widget.movie.name} 🎞", style: TextStyle(color: Colors.white)), backgroundColor: Colors.purple,),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
        Image.asset("photos/${widget.movie.image}"),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

              Text(
                "${widget.movie.price} TL",
                style: TextStyle(fontSize: 50),
              ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            ElevatedButton(
                onPressed: () {
                  print("${widget.movie.name} hired");
                }, child: const Text("Hire"),style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 70)),),
          ],),
    ],
      ),
    ),
    );
  }
}
