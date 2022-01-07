import 'package:atoday/entities/series_status_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'series_status_model.freezed.dart';
part 'series_status_model.g.dart';

@freezed
class SeriesStatusModel extends SeriesStatusEntity with _$SeriesStatusModel {
  const factory SeriesStatusModel({
    @Default('any') String value,
    @Default('Не важно') String title,
    @Default('Не важно') String mobileTitle,
  }) = _SeriesStatusModel;

  factory SeriesStatusModel.fromJson(Map<String, dynamic> json) => _$SeriesStatusModelFromJson(json);
}
