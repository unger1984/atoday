import 'package:atoday/entities/status_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'status_model.freezed.dart';
part 'status_model.g.dart';

@freezed
class StatusModel extends StatusEntity with _$StatusModel {
  const factory StatusModel({
    @Default('any') String value,
    @Default('Любой статус') String title,
    @Default('Любой') String mobileTitle,
  }) = _StatusModel;

  factory StatusModel.fromJson(Map<String, dynamic> json) => _$StatusModelFromJson(json);
}
