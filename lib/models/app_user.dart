class AppUser {
  final String id;
  final String email;
  final String name;
  final String? profilePictureUrl;
  final String? phoneNumber;
  final String dateOfBirth;

  AppUser({
    required this.id,
    required this.email,
    required this.name,
    this.profilePictureUrl,
    this.phoneNumber,
    required this.dateOfBirth,
  });
}
