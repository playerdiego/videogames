// To parse this JSON data, do
//
//     final gamesResponse = gamesResponseFromMap(jsonString);

import 'dart:convert';

import 'game.dart';

class GamesResponse {
    GamesResponse({
        required this.count,
        this.next,
        this.previous,
        required this.results,
    });

    int count;
    String? next;
    String? previous;
    List<Game> results;

    factory GamesResponse.fromJson(String str) => GamesResponse.fromMap(json.decode(str));

    factory GamesResponse.fromMap(Map<String, dynamic> json) => GamesResponse(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: List<Game>.from(json["results"].map((x) => Game.fromMap(x))),
    );
}

class Filters {
    Filters({
        required this.years,
    });

    List<FiltersYear> years;

    factory Filters.fromJson(String str) => Filters.fromMap(json.decode(str));

    factory Filters.fromMap(Map<String, dynamic> json) => Filters(
        years: List<FiltersYear>.from(json["years"].map((x) => FiltersYear.fromMap(x))),
    );
}

class FiltersYear {
    FiltersYear({
        required this.from,
        required this.to,
        required this.filter,
        required this.decade,
        required this.years,
        required this.nofollow,
        required this.count,
    });

    int from;
    int to;
    String filter;
    int decade;
    List<YearYear> years;
    bool nofollow;
    int count;

    factory FiltersYear.fromJson(String str) => FiltersYear.fromMap(json.decode(str));


    factory FiltersYear.fromMap(Map<String, dynamic> json) => FiltersYear(
        from: json["from"],
        to: json["to"],
        filter: json["filter"],
        decade: json["decade"],
        years: List<YearYear>.from(json["years"].map((x) => YearYear.fromMap(x))),
        nofollow: json["nofollow"],
        count: json["count"],
    );

}

class YearYear {
    YearYear({
        required this.year,
        required this.count,
        required this.nofollow,
    });

    int year;
    int count;
    bool nofollow;

    factory YearYear.fromJson(String str) => YearYear.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory YearYear.fromMap(Map<String, dynamic> json) => YearYear(
        year: json["year"],
        count: json["count"],
        nofollow: json["nofollow"],
    );

    Map<String, dynamic> toMap() => {
        "year": year,
        "count": count,
        "nofollow": nofollow,
    };
}

class AddedByStatus {
    AddedByStatus({
        this.yet,
        this.owned,
        this.beaten,
        this.toplay,
        this.dropped,
        this.playing,
    });

    int? yet;
    int? owned;
    int? beaten;
    int? toplay;
    int? dropped;
    int? playing;

    factory AddedByStatus.fromJson(String str) => AddedByStatus.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AddedByStatus.fromMap(Map<String, dynamic> json) => AddedByStatus(
        yet: json["yet"],
        owned: json["owned"],
        beaten: json["beaten"],
        toplay: json["toplay"],
        dropped: json["dropped"],
        playing: json["playing"],
    );

    Map<String, dynamic> toMap() => {
        "yet": yet,
        "owned": owned,
        "beaten": beaten,
        "toplay": toplay,
        "dropped": dropped,
        "playing": playing,
    };
}

class EsrbRating {
    EsrbRating({
          required this.id,
          required this.name,
          required this.slug,
    });

    int id;
    String name;
    String slug;

    factory EsrbRating.fromJson(String str) => EsrbRating.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory EsrbRating.fromMap(Map<String, dynamic> json) => EsrbRating(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "slug": slug,
    };
}

class Genre {
    Genre({
        this.id,
        this.name,
        this.slug,
        this.gamesCount,
        this.imageBackground,
        this.domain,
        this.language,
    });

    int? id;
    String? name;
    String? slug;
    int? gamesCount;
    String? imageBackground;
    String? domain;
    dynamic language;

    factory Genre.fromJson(String str) => Genre.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Genre.fromMap(Map<String, dynamic> json) => Genre(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        gamesCount: json["games_count"],
        imageBackground: json["image_background"],
        domain: json["domain"] == null ? null : json["domain"],
        language: json["language"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "slug": slug,
        "games_count": gamesCount,
        "image_background": imageBackground,
        "domain": domain == null ? null : domain,
        "language": language,
    };
}

class ParentPlatform {
    ParentPlatform({
        required this.platform,
    });

    EsrbRating platform;

    factory ParentPlatform.fromJson(String str) => ParentPlatform.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ParentPlatform.fromMap(Map<String, dynamic> json) => ParentPlatform(
        platform: EsrbRating.fromMap(json["platform"]),
    );

    Map<String, dynamic> toMap() => {
        "platform": platform.toMap(),
    };
}

class PlatformElement {
    PlatformElement({
        required this.platform,
        this.releasedAt,
        required this.requirementsEn,
        required this.requirementsRu,
    });

    PlatformPlatform platform;
    String? releasedAt;
    dynamic requirementsEn;
    dynamic requirementsRu;

    factory PlatformElement.fromJson(String str) => PlatformElement.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PlatformElement.fromMap(Map<String, dynamic> json) => PlatformElement(
        platform: PlatformPlatform.fromMap(json["platform"]),
        releasedAt: json["released_at"],
        requirementsEn: json["requirements_en"],
        requirementsRu: json["requirements_ru"],
    );

    Map<String, dynamic> toMap() => {
        "platform": platform.toMap(),
        "released_at": releasedAt,
        "requirements_en": requirementsEn == null ? null : requirementsEn.toMap(),
        "requirements_ru": requirementsRu == null ? null : requirementsRu.toMap(),
    };
}

class PlatformPlatform {
    PlatformPlatform({
        this.id,
        this.name,
        this.slug,
        this.image,
        this.yearEnd,
        this.yearStart,
        this.gamesCount,
        this.imageBackground,
    });

    int? id;
    String? name;
    String? slug;
    dynamic image;
    dynamic yearEnd;
    dynamic yearStart;
    int? gamesCount;
    String? imageBackground;

    factory PlatformPlatform.fromJson(String str) => PlatformPlatform.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PlatformPlatform.fromMap(Map<String, dynamic> json) => PlatformPlatform(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        image: json["image"],
        yearEnd: json["year_end"],
        yearStart: json["year_start"],
        gamesCount: json["games_count"],
        imageBackground: json["image_background"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "slug": slug,
        "image": image,
        "year_end": yearEnd,
        "year_start": yearStart,
        "games_count": gamesCount,
        "image_background": imageBackground,
    };
}


class Rating {
    Rating({
        required this.id,
        required this.title,
        required this.count,
        required this.percent,
    });

    int id;
    String title;
    int count;
    double percent;

    factory Rating.fromJson(String str) => Rating.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Rating.fromMap(Map<String, dynamic> json) => Rating(
        id: json["id"],
        title: json["title"],
        count: json["count"],
        percent: json["percent"].toDouble(),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "count": count,
        "percent": percent,
    };
}

class ShortScreenshot {
    ShortScreenshot({
        required this.id,
        required this.image,
    });

    int id;
    String image;

    factory ShortScreenshot.fromJson(String str) => ShortScreenshot.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ShortScreenshot.fromMap(Map<String, dynamic> json) => ShortScreenshot(
        id: json["id"],
        image: json["image"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "image": image,
    };
}

class Store {
    Store({
        this.id,
        this.store,
    });

    int? id;
    Genre? store;

    factory Store.fromJson(String str) => Store.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Store.fromMap(Map<String, dynamic> json) => Store(
        id: json["id"],
        store: Genre.fromMap(json["store"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "store": store!.toMap(),
    };
}
