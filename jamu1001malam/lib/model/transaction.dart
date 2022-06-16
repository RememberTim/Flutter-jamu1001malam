import 'home/product.dart';
import 'home/user.dart';

class Transaction {
    Transaction({
        required this.id,
        required this.userId,
        required this.productId,
        required this.quantity,
        required this.total,
        required this.totalKeuntungan,
        required this.status,
        required this.paymentUrl,
        required this.deletedAt,
        required this.createdAt,
        required this.updatedAt,
        required this.product,
        required this.user,
    });

    int id;
    int userId;
    int productId;
    int quantity;
    int total;
    int totalKeuntungan;
    String status;
    String paymentUrl;
    dynamic deletedAt;
    int createdAt;
    int updatedAt;
    Products product;
    User user;

    factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        id: json["id"],
        userId: json["user_id"],
        productId: json["product_id"],
        quantity: json["quantity"],
        total: json["total"],
        totalKeuntungan: json["total_keuntungan"],
        status: json["status"],
        paymentUrl: json["payment_url"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        product: Products.fromJson(json["product"]),
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "product_id": productId,
        "quantity": quantity,
        "total": total,
        "total_keuntungan": totalKeuntungan,
        "status": status,
        "payment_url": paymentUrl,
        "deleted_at": deletedAt,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "product": product.toJson(),
        "user": user.toJson(),
    };
}