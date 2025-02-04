class DocumentTypeEntity {
  String name;
  String id;

  DocumentTypeEntity({
    required this.name,
    required this.id,
  });

  factory DocumentTypeEntity.fromJson(Map<String, dynamic> json) =>
      DocumentTypeEntity(
        name: json["name"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
      };
}
