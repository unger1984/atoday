import 'package:atoday/entities/search_result_entity.dart';
import 'package:atoday/models/book_meta_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_result_model.freezed.dart';
part 'search_result_model.g.dart';

@freezed
class SearchResultModel extends SearchResultEntity with _$SearchResultModel {
  const factory SearchResultModel({
    required bool isLastPage,
    @Default(null) String? errorMessage,
    required int realTotalCount,
    required List<BookMetaModel> searchResults,
  }) = _SearchResultModel;

  factory SearchResultModel.fromJson(Map<String, dynamic> json) => _$SearchResultModelFromJson(json);
}
