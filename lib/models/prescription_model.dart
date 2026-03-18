class PrescriptionModel {
  final String patientName;
  final String doctorName;
  final String date;
  final String medicines;
  final String notes;

  PrescriptionModel({
    required this.patientName,
    required this.doctorName,
    required this.date,
    required this.medicines,
    required this.notes,
  });
}