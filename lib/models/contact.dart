class Contact {
  final String id;
  String name;
  String phone;
  String? avatar;
  Contact({
    required this.id,
    required this.name,
    required this.phone,
    this.avatar,
  });

  bool get hasImage => avatar != null;
}
