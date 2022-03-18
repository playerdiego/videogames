import 'dart:convert';

import 'games_response.dart';

class Game {
    Game({
        required this.id,
        required this.slug,
        required this.name,
        this.released,
        this.tba,
        this.backgroundImage,
        this.rating,
        this.ratingTop,
        this.ratings,
        this.ratingsCount,
        this.reviewsTextCount,
        this.added,
        this.addedByStatus,
        this.metacritic,
        this.playtime,
        this.suggestionsCount,
        this.updated,
        this.userGame,
        this.reviewsCount,
        this.saturatedColor,
        this.dominantColor,
        this.platforms,
        this.parentPlatforms,
        this.genres,
        this.stores,
        this.clip,
        this.tags,
        this.esrbRating,
        this.shortScreenshots,
    });

    int id;
    String slug;
    String name;
    dynamic released;
    bool? tba;
    String? backgroundImage;
    double? rating;
    int? ratingTop;
    List<Rating>? ratings;
    int? ratingsCount;
    int? reviewsTextCount;
    int? added;
    dynamic addedByStatus;
    int? metacritic;
    int? playtime;
    int? suggestionsCount;
    DateTime? updated;
    dynamic? userGame;
    int? reviewsCount;
    String? saturatedColor;
    String? dominantColor;
    List<PlatformElement>? platforms;
    List<ParentPlatform>? parentPlatforms;
    List<Genre>? genres;
    List<Store>? stores;
    dynamic clip;
    List<Genre>? tags;
    EsrbRating? esrbRating;
    List<ShortScreenshot>? shortScreenshots;
    String? heroID;

    factory Game.fromJson(String str) => Game.fromMap(json.decode(str));

    factory Game.fromMap(Map<String, dynamic> json) => Game(
        id: json["id"],
        slug: json["slug"],
        name: json["name"],
        released: json["released"],
        tba: json["tba"],
        backgroundImage: json["background_image"],
        rating: json["rating"].toDouble(),
        ratingTop: json["rating_top"],
        ratings: List<Rating>.from(json["ratings"].map((x) => Rating.fromMap(x))),
        ratingsCount: json["ratings_count"],
        reviewsTextCount: json["reviews_text_count"],
        added: json["added"],
        addedByStatus: json["added_by_status"],
        metacritic: json["metacritic"],
        playtime: json["playtime"],
        suggestionsCount: json["suggestions_count"],
        updated: DateTime.parse(json["updated"]),
        userGame: json["user_game"],
        reviewsCount: json["reviews_count"],
        saturatedColor: json["saturated_color"],
        dominantColor: json["dominant_color"],
        platforms: List<PlatformElement>.from(json["platforms"].map((x) => PlatformElement.fromMap(x))),
        parentPlatforms: List<ParentPlatform>.from(json["parent_platforms"].map((x) => ParentPlatform.fromMap(x))),
        genres: List<Genre>.from(json["genres"].map((x) => Genre.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "slug": slug,
        "name": name,
        "released": released,
        "tba": tba,
        "background_image": backgroundImage,
        "rating": rating,
        "rating_top": ratingTop,
        "ratings": List<dynamic>.from(ratings!.map((x) => x.toMap())),
        "ratings_count": ratingsCount,
        "reviews_text_count": reviewsTextCount,
        "added": added,
        "added_by_status": addedByStatus!.toMap(),
        "metacritic": metacritic,
        "playtime": playtime,
        "suggestions_count": suggestionsCount,
        "updated": updated!.toIso8601String(),
        "user_game": userGame,
        "reviews_count": reviewsCount,
        "saturated_color": saturatedColor,
        "dominant_color": dominantColor,
        "platforms": List<dynamic>.from(platforms!.map((x) => x.toMap())),
        "parent_platforms": List<dynamic>.from(parentPlatforms!.map((x) => x.toMap())),
        "genres": List<dynamic>.from(genres!.map((x) => x.toMap())),
        "stores": List<dynamic>.from(stores!.map((x) => x.toMap())),
        "clip": clip,
        "tags": List<dynamic>.from(tags!.map((x) => x.toMap())),
        "esrb_rating": esrbRating,
        "short_screenshots": List<dynamic>.from(shortScreenshots!.map((x) => x.toMap())),
    };

    get backgroundImageUrl {

      if(backgroundImage != null) {
        return backgroundImage;
      } else {
        return 'https://i.stack.imgur.com/GNhxO.png';
      }

    }
    
}