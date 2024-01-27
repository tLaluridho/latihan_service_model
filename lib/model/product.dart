class Product {
  int? id;
  String? dateTime;
  DateTime? createdAt;
  String? time;
  String? productName;

  Product({
    required this.id,
    required this.dateTime,
    required this.createdAt,
    required this.time,
    required this.productName,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
      id: json["id"],
      createdAt: DateTime.parse(json["created_at"]),
      dateTime: json["dateTime"],
      time: json["time"],
      productName: json["product_name"]);
}
