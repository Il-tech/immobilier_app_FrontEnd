class Category {
  String id;
  String type;
  String image;
  Category({
    this.id,
    this.type,
    this.image
  });
  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        type: json["type"],
        image: json["image"],
      );
}

