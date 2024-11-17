import 'package:flutter/material.dart';
import 'data/joke.dart';

void main() => runApp(const JokeApp());

class JokeApp extends StatelessWidget {
  const JokeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.green[300],
          title: const Text("Favorite Jokes"),
        ),
        body: const JokeList(),
      ),
    );
  }
}

class JokeList extends StatefulWidget {
  const JokeList({super.key});

  @override
  State<JokeList> createState() => _JokeListState();
}

class _JokeListState extends State<JokeList> {
  int? favoriteJokeIndex;

  void toggleFavorite(int index) {
    setState(() {
      favoriteJokeIndex = favoriteJokeIndex == index ? null : index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: jokes.length,
      itemBuilder: (context, index) {
        return JokeCard(
          joke: jokes[index],
          isFavorite: favoriteJokeIndex == index,
          onFavoriteToggle: () => toggleFavorite(index),
        );
      },
    );
  }
}

class JokeCard extends StatelessWidget {
  final Joke joke;
  final bool isFavorite;
  final VoidCallback onFavoriteToggle;

  const JokeCard({
    super.key,
    required this.joke,
    required this.isFavorite,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 0.5, color: Colors.grey),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  joke.title,
                  style: TextStyle(
                    color: Colors.green[300],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(joke.description),
              ],
            ),
          ),
          IconButton(
            onPressed: onFavoriteToggle,
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
