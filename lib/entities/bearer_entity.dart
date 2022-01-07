class BearerEntity {
  final int userId;
  final String token;
  final DateTime issued;
  final DateTime expires;

  BearerEntity({required this.userId, required this.token, required this.issued, required this.expires});
}
