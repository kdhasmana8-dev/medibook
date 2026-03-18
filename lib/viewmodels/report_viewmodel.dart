import 'package:flutter/material.dart';

import '../models/report_model.dart';


class ReportViewModel extends ChangeNotifier {

  List<ReportModel> financialReports = [
    ReportModel(title: "Payment Summary Report"),
    ReportModel(title: "Cash Flow Report"),
    ReportModel(title: "Outstanding Income Report"),
    ReportModel(title: "Treatment wise Report"),
  ];

  List<ReportModel> patientReports = [
    ReportModel(title: "New/Repeat Patients Report"),
    ReportModel(title: "Fees Report"),
    ReportModel(title: "Outstanding Report"),
    ReportModel(title: "Payment Report"),
    ReportModel(title: "Appointment Report"),
    ReportModel(title: "Birthday Report"),
    ReportModel(title: "Follow-up Due Report"),
  ];

  List<ReportModel> doctorReports = [
    ReportModel(title: "Doctor wise Fees Report"),
    ReportModel(title: "Doctor wise Visits Report"),
    ReportModel(title: "Doctor wise Payment Report"),
    ReportModel(title: "Clinic wise Payment Report"),
  ];

  void toggleReport(ReportModel report) {
    report.isExpanded = !report.isExpanded;
    notifyListeners();
  }
}