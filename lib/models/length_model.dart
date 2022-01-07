import 'package:atoday/entities/length_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'length_model.freezed.dart';
part 'length_model.g.dart';

@freezed
class LengthModel extends LengthEntity with _$LengthModel {
  const factory LengthModel({
    @Default('any') String value,
    @Default('Не важно') String title,
    @Default('Не важно') String mobileTitle,
  }) = _LengthModel;

  factory LengthModel.fromJson(Map<String, dynamic> json) => _$LengthModelFromJson(json);
}
