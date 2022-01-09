import 'package:atoday/entities/chapter_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chapter_model.freezed.dart';
part 'chapter_model.g.dart';

@freezed
class ChapterModel extends ChapterEntity with _$ChapterModel {
  const factory ChapterModel({
    required int id,
    @Default(null) String? title,
    @Default(false) bool isDraft,
    @Default(null) DateTime? publishTime,
    @Default(null) DateTime? lastModificationTime,
    @Default('') String text,
    @Default('') String key,
    @Default(false) bool isSuccessful,
    @Default(null) String? message,
  }) = _ChapterModel;

  factory ChapterModel.fromJson(Map<String, dynamic> json) => _$ChapterModelFromJson(json);
}
