// To parse this JSON data, do
//
//     final gameDetailsResponse = gameDetailsResponseFromMap(jsonString);

import 'dart:convert';

class GameDetailsResponse {
    GameDetailsResponse({
        required this.id,
        required this.slug,
        required this.name,
        this.nameOriginal,
        this.description,
        this.metacritic,
        this.released,
        this.backgroundImage,
        this.backgroundImageAdditional,
        this.rating,
        this.ratingTop,
    });

    int id;
    String slug;
    String name;
    String? nameOriginal;
    String? description;
    int? metacritic;
    DateTime? released;
    String? backgroundImage;
    String? backgroundImageAdditional;
    double? rating;
    int? ratingTop;
    String? heroID;

    factory GameDetailsResponse.fromJson(String str) => GameDetailsResponse.fromMap(json.decode(str));

    factory GameDetailsResponse.fromMap(Map<String, dynamic> json) => GameDetailsResponse(
        id: json["id"],
        slug: json["slug"],
        name: json["name"],
        nameOriginal: json["name_original"],
        description: json["description"],
        metacritic: json["metacritic"],
        released: DateTime.parse(json["released"]),
        backgroundImage: json["background_image"],
        backgroundImageAdditional: json["background_image_additional"],
        rating: json["rating"],
        ratingTop: json["rating_top"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "slug": slug,
        "name": name,
        "name_original": nameOriginal,
        "description": description,
        "metacritic": metacritic,
        "released": "${released?.year.toString().padLeft(4, '0')}-${released?.month.toString().padLeft(2, '0')}-${released?.day.toString().padLeft(2, '0')}",
        "background_image": backgroundImage,
        "background_image_additional": backgroundImageAdditional,
        "rating": rating,
        "rating_top": ratingTop,
    };

    get backgroundImageUrl {

      if(backgroundImage != null) {
        return backgroundImage;
      } else {
        return 'https://i.stack.imgur.com/GNhxO.png';
      }

    }

    get backgroundImageAdditionalUrl {
      
      if(backgroundImageAdditional != null) {
        return backgroundImageAdditional;
      } else {
        return backgroundImageUrl;
      }

    }
}
