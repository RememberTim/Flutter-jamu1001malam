class Products {

    int id;
    String name;
    String description;
    String ingredients;
    int price;
    double rate;
    String types;
    String stok;
    String keuntungan;
    String picturePath;
    dynamic deletedAt;
    int createdAt;
    int updatedAt;

    Products({
        required this.id,
        required this.name,
        required this.description,
        required this.ingredients,
        required this.price,
        required this.rate,
        required this.types,
        required this.stok,
        required this.keuntungan,
        required this.picturePath,
        required this.deletedAt,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Products.fromJson(Map<String, dynamic> json) => Products(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        ingredients: json["ingredients"],
        price: json["price"],
        rate: json["rate"].toDouble(),
        types: json["types"],
        stok: json["stok"],
        keuntungan: json["keuntungan"],
        picturePath: json["picturePath"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "ingredients": ingredients,
        "price": price,
        "rate": rate,
        "types": types,
        "stok": stok,
        "keuntungan": keuntungan,
        "picturePath": picturePath,
        "deleted_at": deletedAt,
        "created_at": createdAt,
        "updated_at": updatedAt,
    };
}