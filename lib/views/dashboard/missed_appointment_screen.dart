import 'package:flutter/material.dart';

class MissedAppointmentScreen extends StatefulWidget {
  const MissedAppointmentScreen({super.key});

  @override
  State<MissedAppointmentScreen> createState() => _MissedAppointmentScreenState();
}

class _MissedAppointmentScreenState extends State<MissedAppointmentScreen> {

  bool autoNotify = false;
  bool sms = false;
  bool whatsapp = false;
  bool email = false;

  void showMissedDialog() {

    showDialog(
      context: context,
      builder: (context) {

        return AlertDialog(

          title: const Text("Missed Appointment"),

          content: StatefulBuilder(
            builder: (context, setStateDialog) {

              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  const Text(
                    "Mark appointment as missed?",
                    style: TextStyle(fontSize: 16),
                  ),

                  const SizedBox(height: 15),

                  CheckboxListTile(
                    title: const Text("Auto Notification"),
                    value: autoNotify,
                    onChanged: (v) {
                      setStateDialog(() {
                        autoNotify = v!;
                      });
                    },
                  ),

                  CheckboxListTile(
                    title: const Text("SMS"),
                    value: sms,
                    onChanged: (v) {
                      setStateDialog(() {
                        sms = v!;
                      });
                    },
                  ),

                  CheckboxListTile(
                    title: const Text("WhatsApp"),
                    value: whatsapp,
                    onChanged: (v) {
                      setStateDialog(() {
                        whatsapp = v!;
                      });
                    },
                  ),

                  CheckboxListTile(
                    title: const Text("Email"),
                    value: email,
                    onChanged: (v) {
                      setStateDialog(() {
                        email = v!;
                      });
                    },
                  ),

                ],
              );
            },
          ),

          actions: [

            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancel"),
            ),

            ElevatedButton(
              onPressed: () {

                Navigator.pop(context);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Appointment marked as missed"),
                  ),
                );

              },
              child: const Text("Confirm"),
            ),

          ],
        );
      },
    );
  }

  Widget field(String title, String value) {

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [

          Expanded(
            flex: 2,
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),

          Expanded(
            flex: 3,
            child: Text(value),
          ),

        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Appointment Details"),
        backgroundColor: Colors.teal,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            field("Patient Name", "Rahul Sharma"),
            field("Phone", "9876543210"),
            field("Doctor", "Dr. Karishma"),
            field("Department", "Dental"),
            field("Date", "18/03/2026"),
            field("Time", "10:30 AM"),

            const SizedBox(height: 30),

            Row(
              children: [

                Expanded(
                  child: ElevatedButton(

                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),

                    onPressed: showMissedDialog,

                    child: const Text("Missed"),
                  ),
                ),

                const SizedBox(width: 15),

                Expanded(
                  child: ElevatedButton(

                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),

                    onPressed: () {

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Appointment submitted"),
                        ),
                      );

                    },

                    child: const Text("Submit"),
                  ),
                ),

              ],
            )

          ],
        ),
      ),
    );
  }
}