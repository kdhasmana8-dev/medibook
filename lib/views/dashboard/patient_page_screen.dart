import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../services/teeth_category_screen.dart';
import 'ADD_visit_screen.dart';
import 'appointment_screen.dart';

class PatientDetailScreen extends StatelessWidget {
  const PatientDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],

      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),

      body: Scrollbar(
        thumbVisibility: true,
        child: SingleChildScrollView(
          child: Column(
            children: [

              /// Patient Info Card
              Container(
                color: Colors.white,
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    const Text(
                      "Demo1-Demo Patient",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                    ),

                    const SizedBox(height: 10),

                    const Row(
                      children: [
                        Text("Gender / Age : ",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("Male / 48 Years")
                      ],
                    ),

                    const SizedBox(height: 8),

                    Row(
                      children: const [
                        Text("Contact No.: ",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("6666666666"),
                        SizedBox(width: 10),
                        Icon(Icons.call, color: Colors.green),
                        SizedBox(width: 10),
                        Icon(Icons.mail, color: Colors.orange),
                      ],
                    ),

                    const SizedBox(height: 8),

                    Row(
                      children: const [
                        Text("O/s amount: ",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("₹ 300"),
                        SizedBox(width: 10),
                        Icon(Icons.mail, color: Colors.orange),
                        SizedBox(width: 10),
                        Icon(Icons.credit_card, color: Colors.red),
                      ],
                    ),

                    const SizedBox(height: 15),

                    /// FIXED BUTTON AREA
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: [

                        _button("+ Appointment", () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AppointmentScreen(),
                            ),
                          );
                        }),

                        _button("+ Payment", () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PaymentScreen(),
                            ),
                          );
                        }),

                        _button("Treatment Plan", () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const TreatmentPlanScreen(),
                            ),
                          );
                        }),

                      ],
                    )
                  ],
                ),
              ),

              const SizedBox(height: 10),

              /// Visits Header
              Container(
                color: Colors.blue,
                padding: const EdgeInsets.all(10),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Visits / Prescriptions",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    Icon(Icons.refresh, color: Colors.white)
                  ],
                ),
              ),

              /// Visit List
              ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    padding: const EdgeInsets.all(15),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "13 Mar 2026",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "₹ 900",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 5),

                        Text(
                          "T: Consultation, Treatment",
                          style: TextStyle(color: Colors.grey),
                        ),

                        SizedBox(height: 5),

                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "O/s : ₹ 300",
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),

      /// Bottom Button
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(15),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            padding: const EdgeInsets.all(18),
          ),
          onPressed: () {
            Navigator.push(context,MaterialPageRoute(builder: (context)=>AddVisitScreen()),);
          },
          child: const Text(
            "Add Visit / Prescription",
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),

      /// Floating Tooth Icon
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => const DentalChartScreen(),
          );
        },
        child: const  Icon(
          FontAwesomeIcons.tooth, // The tooth icon
          color: Colors.white,
          size: 40.0,
        ),

      ),
    );
  }

  /// Button Widget
  Widget _button(String title, VoidCallback onTap) {
    return OutlinedButton(
      onPressed: onTap,
      child: Text(title),
    );
  }
}
