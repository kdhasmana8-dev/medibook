import 'package:flutter/material.dart';
import '../models/lab_model.dart';

class LabViewModel extends ChangeNotifier {

  TextEditingController searchController = TextEditingController();

  List<LabModel> labList = [
    LabModel(
      patientName: "Rahul Sharma",
      testName: "Blood Test",
      date: "12 Mar 2026",
      status: "Pending",
      amount: 800,
    ),
    LabModel(
      patientName: "Anita Verma",
      testName: "X-Ray",
      date: "11 Mar 2026",
      status: "Completed",
      amount: 1200,
    ),
  ];

  List<LabModel> filteredList = [];

  LabViewModel() {
    filteredList = labList;
  }

  void searchLab(String value) {

    filteredList = labList.where((lab) =>
        lab.patientName
            .toLowerCase()
            .contains(value.toLowerCase())).toList();

    notifyListeners();
  }
}