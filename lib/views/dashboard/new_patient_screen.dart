import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medibook/views/dashboard/patient_page_screen.dart';
import 'package:medibook/views/homepage_screen.dart';


class CliniciaScreen extends StatelessWidget {
  const CliniciaScreen({super.key});

  void showMessage(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(text)),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Column(
        children: [

          /// TOP RED HEADER
          Container(
            color: Colors.redAccent,
            padding: const EdgeInsets.only(
              top: 40,
              left: 10,
              right: 10,
              bottom: 10,
            ),
            child: Row(
              children: [

                /// Back Button
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),

                /// Logo + Title
                const Icon(Icons.local_hospital,
                    color: Colors.white, size: 28),

                const SizedBox(width: 8),

                const Text(
                  "Clinicia",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const Spacer(),

                /// Send Button
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.white),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const DoctorDashboard()));
                    showMessage(context, "Send Clicked");
                  },
                ),

                /// Print Button
                IconButton(
                  icon: const Icon(Icons.print, color: Colors.white),
                  onPressed: () {

                    showMessage(context, "Print Clicked");
                  },
                ),

                /// WhatsApp Button
                IconButton(
                  icon: const Icon(FontAwesomeIcons.whatsapp,
                      color: Colors.greenAccent, size: 28),
                  onPressed: () {
                    showMessage(context, "WhatsApp Clicked");
                  },
                ),

              ],
            ),
          ),

          /// DOCTOR NAME
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 15),
            color: Colors.grey.shade200,
            child: const Center(
              child: Text(
                "Dr. Karishma Dhasmana",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          /// DATE + FOR
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            color: Colors.grey.shade200,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  "Dates: 01 Mar, 2026 to 31 Mar, 2026",
                  style: TextStyle(fontSize: 16),
                ),

                SizedBox(height: 4),

                Text(
                  "For: Karisma",
                  style: TextStyle(fontSize: 16),
                ),

              ],
            ),
          ),

          const Divider(height: 1),

          /// TABLE HEADER
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 15,
            ),
            child: Row(
              children: const [

                Expanded(
                    flex: 2,
                    child: Text(
                      "Id.",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),

                Expanded(
                    flex: 4,
                    child: Text(
                      "Name",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),

                Expanded(
                    flex: 4,
                    child: Text(
                      "Gender / Age",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),

                Expanded(
                    flex: 4,
                    child: Text(
                      "Creation Date",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),

              ],
            ),
          ),

          const Divider(height: 1),

          /// EMPTY LIST AREA
          Expanded(
            child: Container(
              color: Colors.grey.shade200,
            ),
          ),

        ],
      ),
    );
  }
}