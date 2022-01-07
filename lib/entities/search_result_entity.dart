import 'package:atoday/entities/book_meta_entity.dart';

class SearchResultEntity {
  final bool isLastPage;
  final String? errorMessage;
  final int realTotalCount;
  final List<BookMetaEntity> searchResults;

  SearchResultEntity({
    required this.isLastPage,
    this.errorMessage,
    required this.realTotalCount,
    required this.searchResults,
  });
}
