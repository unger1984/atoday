import 'package:atoday/entities/rating_period_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'rating_period_model.freezed.dart';
part 'rating_period_model.g.dart';

@freezed
class RatingPeriodModel extends RatingPeriodEntity with _$RatingPeriodModel {
  const factory RatingPeriodModel({
    @Default('today') String value,
    @Default('сегодня') String title,
    @Default('сегодня') String mobileTitle,
  }) = _RatingPeriodModel;

  factory RatingPeriodModel.fromJson(Map<String, dynamic> json) => _$RatingPeriodModelFromJson(json);
}
