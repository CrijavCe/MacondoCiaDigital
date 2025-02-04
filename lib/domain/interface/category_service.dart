import 'package:minimal/domain/domain.dart';

abstract class RequestService {
  Future<List<CategoryEntity>> fetchCategories();
  Future<List<DocumentTypeEntity>> fetchDocumentTypes();
  Future<bool> createRequestService(RequestServiceEntity requestService);
}
