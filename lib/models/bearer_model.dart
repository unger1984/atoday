import 'package:atoday/entities/bearer_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bearer_model.freezed.dart';
part 'bearer_model.g.dart';

@freezed
class BearerModel extends BearerEntity with _$BearerModel {
  const factory BearerModel({
    required int userId,
    required String token,
    required DateTime issued,
    required DateTime expires,
  }) = _BearerModel;

  factory BearerModel.fromJson(Map<String, dynamic> json) => _$BearerModelFromJson(json);
}
