import 'package:atoday/entities/sort_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sort_model.freezed.dart';
part 'sort_model.g.dart';

@freezed
class SortModel extends SortEntity with _$SortModel {
  const factory SortModel({
    @Default('popular') String value,
    @Default('по популярности') String title,
    @Default('по популярности') String mobileTitle,
  }) = _SortModel;

  factory SortModel.fromJson(Map<String, dynamic> json) => _$SortModelFromJson(json);
}
