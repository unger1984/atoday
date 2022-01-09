import 'package:atoday/entities/user_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel extends UserEntity with _$UserModel {
  const factory UserModel({
    @JsonKey(name: 'id', required: true, disallowNullValue: true) required int id,
    required String userName,
    String? fio,
    required String email,
    String? avatarUrl,
    String? backgroundUrl,
    required String status,
    required String sex,
    @Default([]) List<String> roles,
    DateTime? birthday,
    DateTime? lastActivity,
    required String workPreferencesPreset,
    @Default([]) List<int> ignoredGenreIds,
    required bool hideDislike,
    required bool hideFinished,
    required bool isBanned,
    String? banReason,
    DateTime? banEnd,
    required bool emailConfirmed,
    required bool isDeleted,
    required bool isDisabled,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}
