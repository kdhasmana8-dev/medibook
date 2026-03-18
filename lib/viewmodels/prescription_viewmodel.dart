import 'package:flutter/material.dart';
import '../models/prescription_model.dart';

class PrescriptionViewModel extends ChangeNotifier {

  List<PrescriptionModel> prescriptions = [];

  List<PrescriptionModel> filteredPrescriptions = [];

  TextEditingController searchController = TextEditingController();

  PrescriptionViewModel() {
    loadPrescriptions();
  }

  void loadPrescriptions() {

    prescriptions = [
      PrescriptionModel(
        patientName: "Rohit Sharma",
        doctorName: "Dr Karishma",
        date: "12 Mar 2026",
        medicines: "Paracetamol, Vitamin D",
        notes: "Take after food",
      ),
      PrescriptionModel(
        patientName: "Anjali Mehta",
        doctorName: "Dr Karishma",
        date: "11 Mar 2026",
        medicines: "Ibuprofen, Calcium",
        notes: "2 times daily",
      ),
      PrescriptionModel(
        patientName: "Rahul Verma",
        doctorName: "Dr Karishma",
        date: "09 Mar 2026",
        medicines: "Antibiotic, Cough Syrup",
        notes: "5 days course",
      ),
    ];

    filteredPrescriptions = prescriptions;

    notifyListeners();
  }

  void searchPrescription(String value) {

    filteredPrescriptions = prescriptions
        .where((p) =>
        p.patientName.toLowerCase().contains(value.toLowerCase()))
        .toList();

    notifyListeners();
  }
}