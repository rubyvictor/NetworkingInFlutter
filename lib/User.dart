class User {
  final String email;
  final String name;
  final int id;

  User({this.id, this.name, this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'],
      name: json['name'],
      id: json['id'],
    );
  }
}
