
final List<String> selectedSymptoms = [
  "Headache",
  "Fatigue",
  "Joint pain",
  "Chest pain",
];

final diaryEntry = {
  "date": "2025-12-26",
  "mood": "Tired",
  "symptoms": selectedSymptoms,
  "notes": "Long day, little rest"
};

// Medication section
final List<Map<String, dynamic>> medications = [
  {
    "name": "Hydroxyurea",
    "dosage": "500mg",
    "quantityLeft": 15,
    "time": "8:00 AM",
    "frequency": "Daily"
  },
  {
    "name": "Folic Acid",
    "dosage": "1mg",
    "quantityLeft": 30,
    "time": "8:00 AM",
    "frequency": "Daily"
  },
  {
    "name": "Pain Relief",
    "dosage": "400mg",
    "quantityLeft": 10,
    "time": "PRN",
    "frequency": "As needed"
  }
];

// Profile data
final Map<String, dynamic> userProfile = {
  "fullName": "Joy Chioma",
  "gender": "Female",
  "dateOfBirth": "1999-05-14",
  "bloodGroup": "O+",
  "genotype": "AA",
  "heightCm": 165,
  "weightKg": 62,

  "emergencyContacts": [
    {
      "name": "Chioma Obidife",
      "relationship": "Sister",
      "phone": "+2348012345678"
    },
    {
      "name": "Dr. Okafor",
      "relationship": "Family Doctor",
      "phone": "+2348098765432"
    }
  ]
};

