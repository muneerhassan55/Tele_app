// ignore_for_file: prefer_null_aware_operators

import 'dart:convert';

class DoctorModel {
    String name;
    String type;
    String description;
    double rating;
    double goodReviews;
    double totalScore;
    double satisfaction;
    bool isfavourite;
    String image;

    DoctorModel({
        required this.name,
        required this.type,
        required this.description,
        required this.rating,
        required this.goodReviews,
        required this.totalScore,
        required this.satisfaction,
        required this.isfavourite,
        required this.image,
    });

    DoctorModel copyWith({
        required String name,
        required String type,
        required String description,
        required double rating,
        required double goodReviews,
        required double totalScore,
        required double satisfaction,
        required bool isfavourite,
        required String image,
    }) => 
        DoctorModel(
            name: name,
            type: type,
            description: description,
            rating: rating,
            goodReviews: goodReviews,
            totalScore: totalScore,
            satisfaction: satisfaction,
            isfavourite: isfavourite,
            image: image,
        );

    factory DoctorModel.fromRawJson(String str) => DoctorModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    // ignore: duplicate_ignore
    factory DoctorModel.fromJson(Map<String, dynamic> json) => DoctorModel(
        name: json["name"],
        type: json["type"],
        description: json["description"],
        
        rating: json["rating"] == null ? null : json["rating"].toDouble(),
        goodReviews: json["goodReviews"] == null ? null : json["goodReviews"].toDouble(),
        totalScore: json["totalScore"] == null ? null : json["totalScore"].toDouble(),
        satisfaction: json["satisfaction"] == null ? null : json["satisfaction"].toDouble(),
        isfavourite: json["isfavourite"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "type": type,
        "description": description,
        "rating": rating,
        "goodReviews": goodReviews,
        "totalScore": totalScore,
        "satisfaction": satisfaction,
        "isfavourite": isfavourite,
        "image": image,
    };
}
