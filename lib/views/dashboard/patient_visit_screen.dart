import 'package:flutter/material.dart';

class PatientVisitReportScreen extends StatelessWidget {
  const PatientVisitReportScreen({super.key});

  @override
  Widget build(BuildContext context) {

    List visits = [
      {
        "id": "101",
        "department": "Dental",
        "doctor": "Dr. Karishma",
        "details": "Cleaning",
        "fee": "500",
        "payment": "500"
      },
      {
        "id": "102",
        "department": "Dental",
        "doctor": "Dr. Karishma",
        "details": "Root Canal",
        "fee": "3000",
        "payment": "1500"
      },
    ];

    int totalPatients = visits.length;

    return Scaffold(

      appBar: AppBar(
        title: const Text("Patient Visit Report"),
        backgroundColor: Colors.redAccent,
      ),

      body: Column(
        children: [

          /// DOCTOR NAME
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15),
            color: Colors.grey.shade200,
            child: const Center(
              child: Text(
                "Dr. Karishma Dhasmana",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          /// DATE RANGE
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            color: Colors.grey.shade200,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Dates: 01 Mar 2026 to 31 Mar 2026"),
                SizedBox(height: 4),
                Text("For: All Patients"),
              ],
            ),
          ),

          const Divider(),

          /// TABLE HEADER
          Container(
            padding: const EdgeInsets.all(10),
            child: const Row(
              children: [

                Expanded(child: Text("Sr No", style: TextStyle(fontWeight: FontWeight.bold))),
                Expanded(child: Text("Patient ID", style: TextStyle(fontWeight: FontWeight.bold))),
                Expanded(child: Text("Dept", style: TextStyle(fontWeight: FontWeight.bold))),
                Expanded(child: Text("Dr Name", style: TextStyle(fontWeight: FontWeight.bold))),
                Expanded(child: Text("Visit Details", style: TextStyle(fontWeight: FontWeight.bold))),
                Expanded(child: Text("Fee", style: TextStyle(fontWeight: FontWeight.bold))),
                Expanded(child: Text("Payment", style: TextStyle(fontWeight: FontWeight.bold))),

              ],
            ),
          ),

          const Divider(),

          /// TABLE DATA
          Expanded(
            child: ListView.builder(
              itemCount: visits.length,
              itemBuilder: (context, index) {

                var v = visits[index];

                return Container(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [

                      Expanded(child: Text("${index + 1}")),
                      Expanded(child: Text(v["id"])),
                      Expanded(child: Text(v["department"])),
                      Expanded(child: Text(v["doctor"])),
                      Expanded(child: Text(v["details"])),
                      Expanded(child: Text("₹${v["fee"]}")),
                      Expanded(child: Text("₹${v["payment"]}")),

                    ],
                  ),
                );
              },
            ),
          ),

          const Divider(),

          /// TOTAL PATIENTS
          Container(
            padding: const EdgeInsets.all(15),
            alignment: Alignment.centerRight,
            child: Text(
              "Total Patients: $totalPatients",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),

        ],
      ),
    );
  }
}