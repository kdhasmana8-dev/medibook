import 'package:flutter/material.dart';

import 'homepage_screen.dart';

class SetupScreen extends StatefulWidget {
  const SetupScreen({super.key});

  @override
  State<SetupScreen> createState() => _SetupScreenState();
}

class _SetupScreenState extends State<SetupScreen> {

  String doctorType = "Doctor";

  final clinicName = TextEditingController();
  final clinicContact = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.grey.shade200,

      body: Column(
        children: [

          /// HEADER
          Container(
            height: 120,
            padding: const EdgeInsets.only(top: 45, left: 16),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF1E88E5),
                  Color(0xFF1565C0),
                ],
              ),
            ),

            child: Row(
              children: [

                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                  ),

                  child: const Icon(
                    Icons.medical_services,
                    color: Colors.blue,
                  ),
                ),

                const SizedBox(width: 12),

                const Text(
                  "Setup",
                  style: TextStyle(
                    fontSize: 26,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          /// RADIO BUTTONS
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),

            child: Row(
              children: [

                Radio(
                  value: "Doctor",
                  groupValue: doctorType,
                  activeColor: const Color(0xFF1565C0),
                  onChanged: (value) {
                    setState(() {
                      doctorType = value!;
                    });
                  },
                ),

                const Text("Doctor"),

                const SizedBox(width: 30),

                Radio(
                  value: "Polyclinic",
                  groupValue: doctorType,
                  activeColor: const Color(0xFF1565C0),
                  onChanged: (value) {
                    setState(() {
                      doctorType = value!;
                    });
                  },
                ),

                const Text("Polyclinic"),
              ],
            ),
          ),

          const SizedBox(height: 10),

          /// PRACTICING CATEGORY
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),

            child: Column(
              children: [

                ListTile(
                  contentPadding: EdgeInsets.zero,

                  title: const Text(
                    "Select Practicing Category",
                    style: TextStyle(color: Colors.grey),
                  ),

                  trailing: const Icon(Icons.arrow_forward_ios, size: 18),

                  onTap: () {},
                ),

                const Divider()
              ],
            ),
          ),

          /// CLINIC NAME
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),

            child: TextField(
              controller: clinicName,

              decoration: const InputDecoration(
                labelText: "Clinic Name",
              ),
            ),
          ),

          const SizedBox(height: 20),

          /// CONTACT NUMBER
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),

            child: TextField(
              controller: clinicContact,

              keyboardType: TextInputType.phone,

              decoration: const InputDecoration(
                labelText: "Clinic Contact No.",
              ),
            ),
          ),

          const SizedBox(height: 40),

          /// SUBMIT BUTTON
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),

            child: SizedBox(
              width: double.infinity,
              height: 50,

              child: ElevatedButton(

                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1565C0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),

                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder:
                          (context) => const DoctorDashboard()));
                },

                child: const Text(
                  "Submit",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}