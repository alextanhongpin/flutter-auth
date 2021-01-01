class Credentials {
  final String accessToken;

  Credentials(this.accessToken);

  factory Credentials.fromJson(Map<String, dynamic> json) {
    return Credentials(json['accessToken']);
  }
}

