import 'package:atoday/entities/book_meta_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'book_meta_model.freezed.dart';
part 'book_meta_model.g.dart';

@freezed
class BookMetaModel extends BookMetaEntity with _$BookMetaModel {
  const factory BookMetaModel({
    @JsonKey(name: 'id', required: true, disallowNullValue: true) required int id,
    required String title,
    String? annotation,
    required int authorId,
    required String authorFIO,
    required String authorUserName,
    String? originalAuthor,
    int? coAuthorId,
    String? coAuthorFIO,
    String? coAuthorUserName,
    required bool coAuthorConfirmed,
    int? seriesId,
    String? seriesTitle,
    DateTime? publishTime,
    DateTime? lastModificationTime,
    DateTime? finishTime,
    required bool isDraft,
    String? formEnum,
    int? genreId,
    int? firstSubGenreId,
    int? secondSubGenreId,
    required bool adultOnly,
    @Default([]) List<String> tags,
    String? coverUrl,
    @Default(0) int viewCount,
    @Default(0) int reviewCount,
    @Default(0) int textLength,
    @Default(0) int likeCount,
    @Default(false) bool showAuthor,
    @Default(null) double? price,
    @Default(null) double? discount,
    required String status,
    @Default(false) bool promoFragment,
    @Default(false) bool isExclusive,
  }) = _BookMetaModel;

  factory BookMetaModel.fromJson(Map<String, dynamic> json) => _$BookMetaModelFromJson(json);
}
