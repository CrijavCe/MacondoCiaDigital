// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:minimal/domain/domain.dart';
import 'package:minimal/infrastructure/infrastructure.dart';
import 'package:minimal/shared/assets/widgets/shared.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_provider.g.dart';

@riverpod
Future<List<CategoryEntity>> categoryList(Ref ref) async {
  final service = HttpRequestService();
  final categories = await service.fetchCategories();
  return [
    CategoryEntity(name: 'Seleccione una categoria', id: 'default'),
    ...categories
  ];
}

@riverpod
class SelectedCategory extends _$SelectedCategory {
  @override
  String? build() => 'Seleccione una categoria';
  void updateSelectedCategory(String? newValue) {
    state = newValue;
  }
}

@riverpod
Future<List<DocumentTypeEntity>> documentTypeList(Ref ref) async {
  final service = HttpRequestService();
  final documents = await service.fetchDocumentTypes();
  return [
    DocumentTypeEntity(name: 'Tipo de documento', id: 'default'),
    ...documents
  ];
}

@riverpod
class SelectedDocumentType extends _$SelectedDocumentType {
  @override
  String? build() => 'Tipo de documento';
  void updateSelectedDocumentType(String? newValue) {
    state = newValue;
  }
}

@riverpod
class RequestForm extends _$RequestForm {
  @override
  void build() {}

  Future<bool> submitForm(
      CategoryEntity category,
      String description,
      String date,
      String startTime,
      String endTime,
      String address,
      String name,
      DocumentTypeEntity documentType,
      String document,
      String email,
      String phone,
      BuildContext context) async {
    final service = HttpRequestService();
    final requestService = RequestServiceEntity(
      category: category,
      description: description,
      date: date,
      startTime: startTime,
      endTime: endTime,
      address: address,
      fullName: name,
      documentType: documentType,
      document: document,
      email: email,
      phone: phone,
    );
    CustomLoading(title: 'Enviando solicitud...', context: context);
    bool response = await service.createRequestService(requestService);

    // Restablecer los valores por defecto de los providers
    ref
        .read(selectedCategoryProvider.notifier)
        .updateSelectedCategory('Seleccione una categoria');
    ref
        .read(selectedDocumentTypeProvider.notifier)
        .updateSelectedDocumentType('Tipo de documento');

    // Cerrar el loading
    Navigator.of(context).pop();
    return response;
  }
}
