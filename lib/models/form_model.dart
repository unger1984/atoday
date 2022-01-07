import 'package:atoday/entities/form_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'form_model.freezed.dart';
part 'form_model.g.dart';

@freezed
class FormModel extends FormEntity with _$FormModel {
  const factory FormModel({
    @Default('Any') String enumValue,
    @Default('any') String value,
    @Default('Любая') String title,
    @Default('Любая') String mobileTitle,
  }) = _FormModel;

  factory FormModel.fromJson(Map<String, dynamic> json) => _$FormModelFromJson(json);
}
