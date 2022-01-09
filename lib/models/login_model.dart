import 'package:atoday/entities/login_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_model.freezed.dart';
part 'login_model.g.dart';

@freezed
class LoginModel extends LoginEntity with _$LoginModel {
  const factory LoginModel({
    required String token,
    required DateTime issued,
    required DateTime expires,
  }) = _LoginModel;

  factory LoginModel.fromJson(Map<String, dynamic> json) => _$LoginModelFromJson(json);
}
