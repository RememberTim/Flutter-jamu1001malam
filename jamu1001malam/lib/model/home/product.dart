import 'dart:ffi';

class Products {
    Products({
        required this.id,
        required this.nama,
        required this.deskripsi,
        required this.bahan,
        required this.harga,
        required this.rating,
        required this.tipe,
        required this.stok,
        required this.keuntungan,
        required this.picturePath,
        required this.deletedAt,
        required this.createdAt,
        required this.updatedAt,
    });

    int id;
    String nama;
    String deskripsi;
    String bahan;
    String harga;
    String rating;
    String tipe;
    String stok;
    String keuntungan;
    String picturePath;
    dynamic deletedAt;
    int createdAt;
    int updatedAt;

    factory Products.fromJson(Map<String, dynamic> json) => Products(
        id: json["id"],
        nama: json["nama"],
        deskripsi: json["deskripsi"],
        bahan: json["bahan"],
        harga: json["harga"],
        rating: json["rating"],
        tipe: json["tipe"],
        stok: json["stok"],
        keuntungan: json["keuntungan"],
        picturePath: json["picturePath"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "deskripsi": deskripsi,
        "bahan": bahan,
        "harga": harga,
        "rating": rating,
        "tipe": tipe,
        "stok": stok,
        "keuntungan": keuntungan,
        "picturePath": picturePath,
        "deleted_at": deletedAt,
        "created_at": createdAt,
        "updated_at": updatedAt,
    };
}