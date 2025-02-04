import 'package:dio/dio.dart';
import 'package:minimal/domain/domain.dart';
import 'package:minimal/infrastructure/api/api.dart';

class HttpRequestService implements RequestService {
  @override
  Future<List<CategoryEntity>> fetchCategories() async {
    try {
      Response response = await Api.get('/categories');
      int statusCode = response.statusCode!;

      if (statusCode == 200) {
        final data = response.data as List<dynamic>;
        List<CategoryEntity> categories =
            data.map((json) => CategoryEntity.fromJson(json)).toList();
        return categories;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  @override
  Future<List<DocumentTypeEntity>> fetchDocumentTypes() async {
    try {
      Response response = await Api.get('/type-document');
      int statusCode = response.statusCode!;

      if (statusCode == 200) {
        final data = response.data as List<dynamic>;
        List<DocumentTypeEntity> documents =
            data.map((json) => DocumentTypeEntity.fromJson(json)).toList();
        return documents;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  @override
  Future<bool> createRequestService(RequestServiceEntity requestService) async {
    try {
      Response response =
          await Api.post('/service-requests', requestService.toJson());
      int statusCode = response.statusCode!;

      if (statusCode == 200 || statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
