import 'package:atoday/entities/period_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'period_model.freezed.dart';
part 'period_model.g.dart';

@freezed
class PeriodModel extends PeriodEntity with _$PeriodModel {
  const factory PeriodModel({
    @Default('-1') String value,
    @Default('Не важно') String title,
    @Default('Не важно') String mobileTitle,
  }) = _PeriodModel;

  factory PeriodModel.fromJson(Map<String, dynamic> json) => _$PeriodModelFromJson(json);
}
