import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:videogames/models/game.dart';
import 'package:videogames/models/game_details_response.dart';
import 'package:videogames/providers/games_provider.dart';

class DetailsScreen extends StatelessWidget {
   
  const DetailsScreen({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {

    final Game game = ModalRoute.of(context)?.settings.arguments as Game;
    final GamesProvider gamesProvider = Provider.of<GamesProvider>(context);


    return FutureBuilder(
      future: gamesProvider.getGameDetails(game.id),
      builder: (context, AsyncSnapshot<GameDetailsResponse> snapshot) {
        if(!snapshot.hasData) {
          return Container(
            constraints: const BoxConstraints(maxHeight: 150),
            width: double.infinity,
            height: 230,
            child: const CupertinoActivityIndicator(),
          );
        }

        snapshot.data?.heroID = game.heroID;

        return Scaffold(
          body: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              _CustomAppBar(game: snapshot.data!),
              SliverList(
                delegate: SliverChildListDelegate([
                  _PosterAndTitle(game: snapshot.data!),
                  const SizedBox(height: 30),
                  _Overview(game: snapshot.data!),
                  _Overview(game: snapshot.data!),
                  _Overview(game: snapshot.data!),
                ])
              )
            ],
          ),
        );
      } ,
    );
  }
}

class _CustomAppBar extends StatelessWidget {

  final GameDetailsResponse game;

  const _CustomAppBar({
    Key? key,
    required this.game
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 250,
      pinned: true,
      floating: false,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
          color: Colors.black45,
          child: Text(game.name)
        ),
        background: FadeInImage(
          placeholder: const AssetImage('assets/loading.gif'),
          image: NetworkImage(game.backgroundImageAdditionalUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {

  final GameDetailsResponse game;
  

  const _PosterAndTitle({
     Key? key,
    required this.game
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {

    final Size size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Hero(
            tag: game.heroID!,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                image: NetworkImage(game.backgroundImageUrl),
                placeholder: const AssetImage('assets/loading.gif'),
                fit: BoxFit.cover,
                height: 150,
                width: 100,
              ),
            ),
          ),

          const SizedBox(width: 20),

          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: size.width - 200),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(game.name, style: Theme.of(context).textTheme.headline5, overflow: TextOverflow.ellipsis, maxLines: 2),
                Row(
                  children: [
                    const Icon(Icons.star),
                    const SizedBox(width: 10),
                    Text('${game.rating}', style: Theme.of(context).textTheme.caption, overflow: TextOverflow.ellipsis)
                  ],
                )
              ],
            ),
          )


        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {

  final GameDetailsResponse game;

  const _Overview({
     Key? key,
     required this.game
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
      child: Text(
        game.description!,
        textAlign: TextAlign.justify,
      ),
    );
  }
}