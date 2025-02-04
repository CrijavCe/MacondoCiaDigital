import 'package:minimal/domain/domain.dart';

class RequestServiceEntity {
  CategoryEntity category;
  String description;
  String date;
  String startTime;
  String endTime;
  String address;
  String fullName;
  DocumentTypeEntity documentType;
  String document;
  String email;
  String phone;

  RequestServiceEntity({
    required this.category,
    required this.description,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.address,
    required this.fullName,
    required this.documentType,
    required this.document,
    required this.email,
    required this.phone,
  });

  Map<String, dynamic> toJson() => {
        "category": category.toJson(),
        "description": description,
        "date": date,
        "time": [startTime, endTime],
        "address": address,
        "additional_details": "none",
        "full_name": fullName,
        "type_document": documentType.toJson(),
        "document": document,
        "email": email,
        "phone": phone,
      };
}
