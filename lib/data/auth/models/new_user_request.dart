class NewUserRequest {
  NewUserRequest({
    required this.name,
    required this.email,
    required this.password,
    this.address,
    this.phonenumber,
    this.gender,
    this.age,
  });

  final String name;
  final String email;
  final String password;
  final String? address;
  final int? phonenumber; 
  int? gender;
  String? age;
}
