import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:videogames/providers/games_provider.dart';
import 'package:videogames/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final GamesProvider gamesProvider = Provider.of<GamesProvider>(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        // title: const Text('Videogames Flutter App'),
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search)
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            CardSwiper(games: gamesProvider.topGames),
            GameSlider(games: gamesProvider.popularGames, title: 'Populares', onLoadMore: gamesProvider.getPopularGames),
            // GameSlider(games: gamesProvider.topGames, title: 'Mejor valorados', onLoadMore: gamesProvider.getTopGames),
          ],
        ),
      ),
    );
  }
}