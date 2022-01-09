class LoginEntity {
  final String token;
  final DateTime issued;
  final DateTime expires;

  LoginEntity({required this.token, required this.issued, required this.expires});
}
