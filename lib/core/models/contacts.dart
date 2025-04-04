class Contacts {
  String username;
  String email;
  String phone_number;
  String? image_path;
  Contacts(
      {required this.username,
      required this.email,
      required this.phone_number,
      this.image_path});
}
