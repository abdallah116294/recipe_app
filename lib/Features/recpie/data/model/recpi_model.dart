class RecipeModel {
    RecipeModel({
        required this.id,
        required this.fats,
        required this.name,
        required this.time,
        required this.image,
        required this.weeks,
        required this.carbos,
        required this.fibers,
        required this.rating,
        required this.country,
        required this.ratings,
        required this.calories,
        required this.headline,
        required this.keywords,
        required this.products,
        required this.proteins,
        required this.favorites,
        required this.difficulty,
        required this.description,
        required this.highlighted,
        required this.ingredients,
        required this.incompatibilities,
        required this.deliverableIngredients,
        required this.undeliverableIngredients,
    });

    final String? id;
    final String? fats;
    final String? name;
    final String? time;
    final String? image;
    final List<String> weeks;
    final String? carbos;
    final String? fibers;
    final num? rating;
    final String? country;
    final num? ratings;
    final String? calories;
    final String? headline;
    final List<String> keywords;
    final List<String> products;
    final String? proteins;
    final num? favorites;
    final num? difficulty;
    final String? description;
    final bool? highlighted;
    final List<String> ingredients;
    final dynamic incompatibilities;
    final List<String> deliverableIngredients;
    final List<dynamic> undeliverableIngredients;

    factory RecipeModel.fromJson(Map<String, dynamic> json){ 
        return RecipeModel(
            id: json["id"],
            fats: json["fats"],
            name: json["name"],
            time: json["time"],
            image: json["image"],
            weeks: json["weeks"] == null ? [] : List<String>.from(json["weeks"]!.map((x) => x)),
            carbos: json["carbos"],
            fibers: json["fibers"],
            rating: json["rating"],
            country: json["country"],
            ratings: json["ratings"],
            calories: json["calories"],
            headline: json["headline"],
            keywords: json["keywords"] == null ? [] : List<String>.from(json["keywords"]!.map((x) => x)),
            products: json["products"] == null ? [] : List<String>.from(json["products"]!.map((x) => x)),
            proteins: json["proteins"],
            favorites: json["favorites"],
            difficulty: json["difficulty"],
            description: json["description"],
            highlighted: json["highlighted"],
            ingredients: json["ingredients"] == null ? [] : List<String>.from(json["ingredients"]!.map((x) => x)),
            incompatibilities: json["incompatibilities"],
            deliverableIngredients: json["deliverable_ingredients"] == null ? [] : List<String>.from(json["deliverable_ingredients"]!.map((x) => x)),
            undeliverableIngredients: json["undeliverable_ingredients"] == null ? [] : List<dynamic>.from(json["undeliverable_ingredients"]!.map((x) => x)),
        );
    }

}
