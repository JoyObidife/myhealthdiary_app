
class MedicalProfile {
  final String id;
  final String userId;
  final String genotype;
  final String bloodType;
  final String hospitalName;
  final String doctorName;
  final String allergies;
  final String? doctorPhoneNumber;
  final String currentMedications;

  MedicalProfile({
    required this.id,
    required this.userId,
    required this.bloodType,
    required this.allergies,
    required this.genotype,
    required this.hospitalName,
    required this.doctorName,
    required this.currentMedications,
    this.doctorPhoneNumber,
  });
}
