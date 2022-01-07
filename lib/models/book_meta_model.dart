import 'package:atoday/entities/book_meta_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'book_meta_model.freezed.dart';
part 'book_meta_model.g.dart';

@freezed
class BookMetaModel extends BookMetaEntity with _$BookMetaModel {
  const factory BookMetaModel({
    @JsonKey(name: 'id', required: true, disallowNullValue: true) required int id,
    required String title,
    required String annotation,
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
    required DateTime publishTime,
    required DateTime lastModificationTime,
    DateTime? finishTime,
    required bool isDraft,
    required String formEnum,
    required int genreId,
    int? firstSubGenreId,
    int? secondSubGenreId,
    required bool adultOnly,
    required List<String> tags,
    String? coverUrl,
    required int viewCount,
    required int reviewCount,
    required int textLength,
    required int likeCount,
    required bool showAuthor,
    @Default(null) double? price,
    @Default(null) double? discount,
    required String status,
    required bool promoFragment,
    required bool isExclusive,
  }) = _BookMetaModel;

  factory BookMetaModel.fromJson(Map<String, dynamic> json) => _$BookMetaModelFromJson(json);
}
