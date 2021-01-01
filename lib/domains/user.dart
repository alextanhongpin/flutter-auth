class User {
  final String email;

  User(this.email);

  factory User.fromJson(Map<String, dynamic> json) {
    return User(json['email']);
  }
}

