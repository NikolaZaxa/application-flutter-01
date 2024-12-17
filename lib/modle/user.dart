class User {
  final String username;
  final String fullName;
  final String phone;
  final String email;

  User({required this.username, required this.fullName, required this.phone, required this.email});

  // Factory constructor for JSON decoding
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
      fullName: json['full_name'],
      phone: json['phone'],
      email: json['email'],
    );
  }

  // Convert data to JSON
  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'full_name': fullName,
      'phone': phone,
      'email': email,
    };
  }
}
