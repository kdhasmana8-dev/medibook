import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodels/report_viewmodel.dart';
import '../widget/report_widegtscreen.dart';



class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final vm = Provider.of<ReportViewModel>(context);

    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Reports"),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            sectionTitle("Financial Reports"),

            ...vm.financialReports.map((e) =>
                ReportTile(
                  report: e,
                  onTap: () => vm.toggleReport(e),
                )
            ),

            const SizedBox(height: 20),

            sectionTitle("Patient Reports"),

            ...vm.patientReports.map((e) =>
                ReportTile(
                  report: e,
                  onTap: () => vm.toggleReport(e),
                )
            ),

            const SizedBox(height: 20),

            sectionTitle("Doctor/Clinic Reports"),

            ...vm.doctorReports.map((e) =>
                ReportTile(
                  report: e,
                  onTap: () => vm.toggleReport(e),
                )
            ),
          ],
        ),
      ),
    );
  }

  Widget sectionTitle(String title) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      color: Colors.blueAccent,
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }
}