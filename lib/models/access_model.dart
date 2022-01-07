import 'package:atoday/entities/access_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'access_model.freezed.dart';
part 'access_model.g.dart';

@freezed
class AccessModel extends AccessEntity with _$AccessModel {
  const factory AccessModel({
    @Default('any') String value,
    @Default('Любой') String title,
    @Default('Любой') String mobileTitle,
  }) = _AccessModel;

  factory AccessModel.fromJson(Map<String, dynamic> json) => _$AccessModelFromJson(json);
}
