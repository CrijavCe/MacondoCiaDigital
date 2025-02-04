// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$categoryListHash() => r'269df6e2667dfa79a05de8f1a77185215cda67b6';

/// See also [categoryList].
@ProviderFor(categoryList)
final categoryListProvider =
    AutoDisposeFutureProvider<List<CategoryEntity>>.internal(
  categoryList,
  name: r'categoryListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$categoryListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CategoryListRef = AutoDisposeFutureProviderRef<List<CategoryEntity>>;
String _$documentTypeListHash() => r'4850b44f1f1f53642d360c22d3f12c4b7ba78632';

/// See also [documentTypeList].
@ProviderFor(documentTypeList)
final documentTypeListProvider =
    AutoDisposeFutureProvider<List<DocumentTypeEntity>>.internal(
  documentTypeList,
  name: r'documentTypeListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$documentTypeListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef DocumentTypeListRef
    = AutoDisposeFutureProviderRef<List<DocumentTypeEntity>>;
String _$selectedCategoryHash() => r'33830878fd49e644b0514b48a10542642cc5b56a';

/// See also [SelectedCategory].
@ProviderFor(SelectedCategory)
final selectedCategoryProvider =
    AutoDisposeNotifierProvider<SelectedCategory, String?>.internal(
  SelectedCategory.new,
  name: r'selectedCategoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$selectedCategoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SelectedCategory = AutoDisposeNotifier<String?>;
String _$selectedDocumentTypeHash() =>
    r'458cb559e1b9df5bd79a80a22476f56a1f2f0252';

/// See also [SelectedDocumentType].
@ProviderFor(SelectedDocumentType)
final selectedDocumentTypeProvider =
    AutoDisposeNotifierProvider<SelectedDocumentType, String?>.internal(
  SelectedDocumentType.new,
  name: r'selectedDocumentTypeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$selectedDocumentTypeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SelectedDocumentType = AutoDisposeNotifier<String?>;
String _$requestFormHash() => r'e536240a9352ffc7df8fe21fb117c98d1951308f';

/// See also [RequestForm].
@ProviderFor(RequestForm)
final requestFormProvider =
    AutoDisposeNotifierProvider<RequestForm, void>.internal(
  RequestForm.new,
  name: r'requestFormProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$requestFormHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$RequestForm = AutoDisposeNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
