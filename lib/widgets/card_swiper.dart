import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:videogames/models/game.dart';

class CardSwiper extends StatelessWidget {

  final List<Game> games;

  const CardSwiper({
    Key? key,
    required this.games
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: double.infinity,
      height: size.height * .5,
      child: Swiper(
        itemCount: games.length,
        control: const SwiperControl(),
        itemBuilder: (context, index) {
      
          games[index].heroID = 'swiper-${games[index].id}';
      
          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details', arguments: games[index]),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Hero(
                  tag: 'swiper-${games[index].id}',
                  child: FadeInImage(
                    image: NetworkImage(games[index].backgroundImageUrl),
                    placeholder: const AssetImage('assets/loading.gif'),
                    fit: BoxFit.cover,
                    height: double.infinity,
                  )
                ),
                _Overlay(size: size),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(games[index].name, style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    )),
                    const SizedBox(height: 20),
                    Text('${games[index].metacritic} / 100'),
                  ],
                )
                
              ]
            ),
          );
        },
      ),
    );
  }
}

class _Overlay extends StatelessWidget {
  const _Overlay({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: size.height * .5,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [
            0.65,0.9, 1
          ],
          colors: [
            Colors.black12,
            Color.fromRGBO(0, 0, 0, .9),
            Colors.black
          ]
        )
      ),
    );
  }
}