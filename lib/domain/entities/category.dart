class CategoryEntity {
  String name;
  String id;

  CategoryEntity({
    required this.name,
    required this.id,
  });

  factory CategoryEntity.fromJson(Map<String, dynamic> json) => CategoryEntity(
        name: json["name"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
      };
}
