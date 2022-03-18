import 'package:flutter/material.dart';
import 'package:videogames/models/game.dart';

class GameSlider extends StatefulWidget {

  final List<Game> games;
  final String title;
  final Function onLoadMore;

  const GameSlider({
    Key? key,
    required this.games,
    required this.title,
    required this.onLoadMore
  }) : super(key: key);

  @override
  State<GameSlider> createState() => _GameSliderState();
}

class _GameSliderState extends State<GameSlider> {

  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      
      if(scrollController.position.pixels + 300 > scrollController.position.maxScrollExtent) {
        widget.onLoadMore();
        setState(() {});
      }

    });

  }


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 20),
            child: Text(widget.title),
          ),

          Expanded(
            child: ListView.builder(
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: widget.games.length,
              itemBuilder: (BuildContext context, int index) => _MoviePoster(game: widget.games[index]),
            ),
          ),
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {

  final Game game;

  const _MoviePoster({
    Key? key,
    required this.game
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    game.heroID = 'slider-${game.id}';

    return Container(
      width: 130,
      height: 190,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details', arguments: game),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Hero(
                tag: game.heroID!,
                child: FadeInImage(
                  height: 180,
                  placeholder: const AssetImage('assets/loading.gif'),
                  image: NetworkImage(game.backgroundImageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(game.name, overflow: TextOverflow.ellipsis, maxLines: 1),
          )
        ],
      ),
    );
  }
}