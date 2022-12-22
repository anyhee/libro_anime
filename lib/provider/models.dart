// To parse this JSON data, do
//
//     final animeApi = animeApiFromMap(jsonString);

import 'dart:convert';

class AnimeApi {
    AnimeApi({
        required this.data,

    });

    List<Datum> data;


    factory AnimeApi.fromJson(String str) => AnimeApi.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AnimeApi.fromMap(Map<String, dynamic> json) => AnimeApi(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "data": List<dynamic>.from(data.map((x) => x.toMap())),

    };
}

class Datum {
    Datum({
       required this.id,
       required this.links,
       required this.attributes,
       required this.relationships,
    });

    String id;
    DatumLinks links;
    Attributes attributes;
    Map<String, Relationship> relationships;

    factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        id: json["id"],
        links: DatumLinks.fromMap(json["links"]),
        attributes: Attributes.fromMap(json["attributes"]),
        relationships: Map.from(json["relationships"]).map((k, v) => MapEntry<String, Relationship>(k, Relationship.fromMap(v))),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "links": links.toMap(),
        "attributes": attributes.toMap(),
        "relationships": Map.from(relationships).map((k, v) => MapEntry<String, dynamic>(k, v.toMap())),
    };
}

class Attributes {
    Attributes({
      required  this.createdAt,
      required  this.updatedAt,
      required  this.slug,
      required  this.synopsis,
      required  this.description,
      required  this.coverImageTopOffset,
      required  this.titles,
      required  this.canonicalTitle,
      required  this.abbreviatedTitles,
      required  this.averageRating,
      required  this.ratingFrequencies,
      required  this.userCount,
      required  this.favoritesCount,
      required  this.popularityRank,
      required  this.ratingRank,
      required  this.ageRatingGuide,
      required  this.tba,
      required  this.posterImage,
      required  this.episodeCount,
      required  this.episodeLength,
      required  this.totalLength,
      required  this.youtubeVideoId,
      required  this.nsfw,
    });

    DateTime createdAt;
    DateTime updatedAt;
    String slug;
    String synopsis;
    String description;
    int coverImageTopOffset;
    Titles titles;
    String canonicalTitle;
    List<String> abbreviatedTitles;
    String averageRating;
    Map<String, String> ratingFrequencies;
    int userCount;
    int favoritesCount;
    int popularityRank;
    int ratingRank; 
    String ageRatingGuide;
    String tba;
    PosterImage posterImage;
    int episodeCount;
    int episodeLength;
    int totalLength;
    String youtubeVideoId;
   
    bool nsfw;

    factory Attributes.fromJson(String str) => Attributes.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Attributes.fromMap(Map<String, dynamic> json) => Attributes(
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        slug: json["slug"],
        synopsis: json["synopsis"],
        description: json["description"],
        coverImageTopOffset: json["coverImageTopOffset"],
        titles: Titles.fromMap(json["titles"]),
        canonicalTitle: json["canonicalTitle"],
        abbreviatedTitles: List<String>.from(json["abbreviatedTitles"].map((x) => x)),
        averageRating: json["averageRating"],
        ratingFrequencies: Map.from(json["ratingFrequencies"]).map((k, v) => MapEntry<String, String>(k, v)),
        userCount: json["userCount"],
        favoritesCount: json["favoritesCount"],

        popularityRank: json["popularityRank"],
        ratingRank: json["ratingRank"],
        ageRatingGuide: json["ageRatingGuide"],
        tba: json["tba"] ?? ' ',
        posterImage: PosterImage.fromMap(json["posterImage"]),
        episodeCount: json["episodeCount"] ?? 1,
        episodeLength: json["episodeLength"] ?? 1,
        totalLength: json["totalLength"],
        youtubeVideoId: json["youtubeVideoId"] ?? '',
        nsfw: json["nsfw"],
    );

    Map<String, dynamic> toMap() => {
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "slug": slug,
        "synopsis": synopsis,
        "description": description,
        "coverImageTopOffset": coverImageTopOffset,
        "titles": titles.toMap(),
        "canonicalTitle": canonicalTitle,
        "abbreviatedTitles": List<dynamic>.from(abbreviatedTitles.map((x) => x)),
        "averageRating": averageRating,
        "ratingFrequencies": Map.from(ratingFrequencies).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "userCount": userCount,
        "favoritesCount": favoritesCount,
        "popularityRank": popularityRank,
        "ratingRank": ratingRank,
        "ageRatingGuide": ageRatingGuide,
        "tba": tba == null ? null : tba,
        "posterImage": posterImage.toMap(),
        "episodeCount": episodeCount == null ? null : episodeCount,
        "episodeLength": episodeLength == null ? null : episodeLength,
        "totalLength": totalLength,
        "youtubeVideoId": youtubeVideoId == null ? null : youtubeVideoId,
  
        "nsfw": nsfw,
    };
}

class CoverImage {
    CoverImage({
       required this.tiny,
      required  this.large,
      required  this.small,
      required  this.original,
      required  this.meta,
    });

    String tiny;
    String large;
    String small;
    String original;
    CoverImageMeta meta;

    factory CoverImage.fromJson(String str) => CoverImage.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory CoverImage.fromMap(Map<String, dynamic> json) => CoverImage(
        tiny: json["tiny"],
        large: json["large"],
        small: json["small"],
        original: json["original"],
        meta: CoverImageMeta.fromMap(json["meta"]),
    );

    Map<String, dynamic> toMap() => {
        "tiny": tiny,
        "large": large,
        "small": small,
        "original": original,
        "meta": meta.toMap(),
    };
}

class CoverImageMeta {
    CoverImageMeta({
       required this.dimensions,
    });

    Dimensions dimensions;

    factory CoverImageMeta.fromJson(String str) => CoverImageMeta.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory CoverImageMeta.fromMap(Map<String, dynamic> json) => CoverImageMeta(
        dimensions: Dimensions.fromMap(json["dimensions"]),
    );

    Map<String, dynamic> toMap() => {
        "dimensions": dimensions.toMap(),
    };
}

class Dimensions {
    Dimensions({
      required  this.tiny,
      required  this.large,
      required  this.small,
    });

    Large tiny;
    Large large;
    Large small;

    factory Dimensions.fromJson(String str) => Dimensions.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Dimensions.fromMap(Map<String, dynamic> json) => Dimensions(
        tiny: Large.fromMap(json["tiny"]),
        large: Large.fromMap(json["large"]),
        small: Large.fromMap(json["small"]),
    );

    Map<String, dynamic> toMap() => {
        "tiny": tiny.toMap(),
        "large": large.toMap(),
        "small": small.toMap(),
    };
}

class Large {
    Large({
       required this.width,
       required this.height,
    });

    int width;
    int height;

    factory Large.fromJson(String str) => Large.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Large.fromMap(Map<String, dynamic> json) => Large(
        width: json["width"],
        height: json["height"],
    );

    Map<String, dynamic> toMap() => {
        "width": width,
        "height": height,
    };
}

class PosterImage {
    PosterImage({
      required  this.tiny,
      required  this.large,
      required  this.small,
      required  this.medium,
      required  this.original,
      required  this.meta,
    });

    String tiny;
    String large;
    String small;
    String medium;
    String original;
    CoverImageMeta meta;

    factory PosterImage.fromJson(String str) => PosterImage.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PosterImage.fromMap(Map<String, dynamic> json) => PosterImage(
        tiny: json["tiny"],
        large: json["large"],
        small: json["small"],
        medium: json["medium"],
        original: json["original"],
        meta: CoverImageMeta.fromMap(json["meta"]),
    );

    Map<String, dynamic> toMap() => {
        "tiny": tiny,
        "large": large,
        "small": small,
        "medium": medium,
        "original": original,
        "meta": meta.toMap(),
    };
}

enum ShowTypeEnum { TV, MOVIE }


class Titles {
    Titles({
      required  this.en,
      required  this.enJp,
      required  this.jaJp,
      required  this.enUs,
    });

    String en;
    String enJp;
    String jaJp;
    String enUs;

    factory Titles.fromJson(String str) => Titles.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Titles.fromMap(Map<String, dynamic> json) => Titles(
        en: json["en"] ?? ' ',
        enJp: json["en_jp"],
        jaJp: json["ja_jp"],
        enUs: json["en_us"] ?? ' ',
    );

    Map<String, dynamic> toMap() => {
        "en": en == null ? null : en,
        "en_jp": enJp,
        "ja_jp": jaJp,
        "en_us": enUs == null ? null : enUs,
    };
}

class DatumLinks {
    DatumLinks({
      required  this.self,
    });

    String self;

    factory DatumLinks.fromJson(String str) => DatumLinks.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory DatumLinks.fromMap(Map<String, dynamic> json) => DatumLinks(
        self: json["self"],
    );

    Map<String, dynamic> toMap() => {
        "self": self,
    };
}

class Relationship {
    Relationship({
       required this.links,
    });

    RelationshipLinks links;

    factory Relationship.fromJson(String str) => Relationship.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Relationship.fromMap(Map<String, dynamic> json) => Relationship(
        links: RelationshipLinks.fromMap(json["links"]),
    );

    Map<String, dynamic> toMap() => {
        "links": links.toMap(),
    };
}

class RelationshipLinks {
    RelationshipLinks({
       required this.self,
       required this.related,
    });

    String self;
    String related;

    factory RelationshipLinks.fromJson(String str) => RelationshipLinks.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory RelationshipLinks.fromMap(Map<String, dynamic> json) => RelationshipLinks(
        self: json["self"],
        related: json["related"],
    );

    Map<String, dynamic> toMap() => {
        "self": self,
        "related": related,
    };
}
