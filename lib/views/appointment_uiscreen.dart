import 'package:flutter/material.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({super.key});

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {

  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController notesController = TextEditingController();

  String department = "Dental";
  String doctor = "Dr. Karishma";
  String visitType = "Consultation";

  Future pickDate() async {

    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2023),
        lastDate: DateTime(2030));

    if (picked != null) {
      setState(() {
        dateController.text =
        "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  Future pickTime() async {

    TimeOfDay? picked =
    await showTimePicker(context: context, initialTime: TimeOfDay.now());

    if (picked != null) {

      setState(() {
        timeController.text = picked.format(context);
      });

    }
  }

  void submitAppointment() {

    if (_formKey.currentState!.validate()) {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Appointment Booked Successfully"),
        ),
      );

    }

  }

  Widget fieldTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Book Appointment"),
        backgroundColor: Colors.teal,
      ),

      body: Form(

        key: _formKey,

        child: SingleChildScrollView(

          padding: const EdgeInsets.all(16),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              fieldTitle("Patient Name"),

              TextFormField(
                controller: nameController,
                validator: (v) =>
                v!.isEmpty ? "Enter patient name" : null,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 15),

              fieldTitle("Phone Number"),

              TextFormField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                validator: (v) =>
                v!.isEmpty ? "Enter phone number" : null,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 15),

              fieldTitle("Department"),

              DropdownButtonFormField(
                value: department,
                items: const [

                  DropdownMenuItem(
                      value: "Dental", child: Text("Dental")),

                  DropdownMenuItem(
                      value: "Orthodontics",
                      child: Text("Orthodontics")),

                  DropdownMenuItem(
                      value: "Implant", child: Text("Implant")),

                ],
                onChanged: (v) {
                  setState(() {
                    department = v!;
                  });
                },
              ),

              const SizedBox(height: 15),

              fieldTitle("Doctor"),

              DropdownButtonFormField(
                value: doctor,
                items: const [

                  DropdownMenuItem(
                      value: "Dr. Karishma",
                      child: Text("Dr. Karishma")),

                  DropdownMenuItem(
                      value: "Dr. Sharma",
                      child: Text("Dr. Sharma")),

                ],
                onChanged: (v) {
                  setState(() {
                    doctor = v!;
                  });
                },
              ),

              const SizedBox(height: 15),

              fieldTitle("Appointment Date"),

              TextFormField(
                controller: dateController,
                readOnly: true,
                onTap: pickDate,
                decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.calendar_today),
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 15),

              fieldTitle("Appointment Time"),

              TextFormField(
                controller: timeController,
                readOnly: true,
                onTap: pickTime,
                decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.access_time),
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 15),

              fieldTitle("Visit Type"),

              DropdownButtonFormField(
                value: visitType,
                items: const [

                  DropdownMenuItem(
                      value: "Consultation",
                      child: Text("Consultation")),

                  DropdownMenuItem(
                      value: "Follow Up",
                      child: Text("Follow Up")),

                  DropdownMenuItem(
                      value: "Emergency",
                      child: Text("Emergency")),

                ],
                onChanged: (v) {
                  setState(() {
                    visitType = v!;
                  });
                },
              ),

              const SizedBox(height: 15),

              fieldTitle("Notes"),

              TextFormField(
                controller: notesController,
                maxLines: 3,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 30),

              /// SUBMIT BUTTON
              SizedBox(
                width: double.infinity,
                height: 50,

                child: ElevatedButton(

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                  ),

                  onPressed: submitAppointment,

                  child: const Text(
                    "Submit Appointment",
                    style: TextStyle(fontSize: 16),
                  ),

                ),
              ),

              const SizedBox(height: 30),

            ],
          ),
        ),
      ),
    );
  }
}