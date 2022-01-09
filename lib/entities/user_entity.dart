class UserEntity {
  final int id;
  final String userName;
  final String? fio;
  final String email;
  final String? avatarUrl;
  final String? backgroundUrl;
  final String status;
  final String sex;
  final List<String> roles;
  final DateTime? birthday;
  final DateTime? lastActivity;
  final String workPreferencesPreset;
  final List<int>? ignoredGenreIds;
  final bool hideDislike;
  final bool hideFinished;
  final bool isBanned;
  final String? banReason;
  final DateTime? banEnd;
  final bool emailConfirmed;
  final bool isDeleted;
  final bool isDisabled;

  UserEntity({
    required this.id,
    required this.userName,
    this.fio,
    required this.email,
    this.avatarUrl,
    this.backgroundUrl,
    required this.status,
    required this.sex,
    required this.roles,
    this.birthday,
    this.lastActivity,
    required this.workPreferencesPreset,
    this.ignoredGenreIds,
    required this.hideDislike,
    required this.hideFinished,
    required this.isBanned,
    this.banReason,
    this.banEnd,
    required this.emailConfirmed,
    required this.isDeleted,
    required this.isDisabled,
  });
}
