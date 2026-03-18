import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PdfService {

  static Future<void> generateAppointmentPdf({
    required String appointmentType,
    required String patientName,
    required String date,
    required String slot,

  }) async {

    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {

          return pw.Padding(
            padding: const pw.EdgeInsets.all(20),

            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,

              children: [

                pw.Text(
                  "Doctor Appointment Receipt",
                  style: pw.TextStyle(
                    fontSize: 24,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),

                pw.SizedBox(height: 20),

                pw.Text("Patient Name: $patientName"),
                pw.Text("Appointment Date: $date"),
                pw.Text("Time Slot: $slot"),
                pw.Text("Appointment Type: $appointmentType"),

                pw.SizedBox(height: 30),

                pw.Text(
                  "Appointment booked successfully.",
                ),

                pw.SizedBox(height: 40),

                pw.Text(
                  "Doctor Clinic",
                  style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                ),
              ],
            ),
          );
        },
      ),
    );

    await Printing.layoutPdf(
      onLayout: (format) async => pdf.save(),
    );
  }
}