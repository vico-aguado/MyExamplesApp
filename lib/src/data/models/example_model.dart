// To parse this JSON data, do
//
//     final example = exampleFromJson(jsonString);

import 'dart:convert';

Example exampleFromJson(String str) {
    final jsonData = json.decode(str);
    return Example.fromJson(jsonData);
}

String exampleToJson(Example data) {
    final dyn = data.toJson();
    return json.encode(dyn);
}

class Example {
    String title;
    String image;
    String description;
    String route;

    Example({
        this.title,
        this.image,
        this.description,
        this.route,
    });

    factory Example.fromJson(Map<String, dynamic> json) => new Example(
        title: json["title"],
        image: json["image"],
        description: json["description"],
        route: json["route"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "image": image,
        "description": description,
        "route": route,
    };

    @override
      String toString() {
        return "\n{title: $title, image: $image, route: $route, description: $description}";
      }
}