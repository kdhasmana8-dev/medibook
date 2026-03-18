import 'package:flutter/material.dart';
import '../models/appointment_model.dart';

class AppointmentViewModel extends ChangeNotifier {

  DateTime selectedDate = DateTime.now();

  String? selectedSlot;

  String? selectedPatient;

  List<String> patients = [
    "John Doe",
    "Emma Watson",
    "Michael Smith"
  ];

  List<String> timeSlots = [
    "09:00",
    "09:30",
    "10:00",
    "10:30",
    "11:00",
    "11:30",
    "12:00",
    "12:30",
  ];

  List<AppointmentModel> appointments = [];

  String? patientName;
  String appointmentType = "Walk-In";

  void setPatientName(String name){
    patientName = name;
    notifyListeners();
  }

  void setAppointmentType(String type){
    appointmentType = type;
    notifyListeners();
  }

  /// select date
  void selectDate(DateTime date) {
    selectedDate = date;
    selectedSlot = null;
    notifyListeners();
  }

  /// select patient
  void selectPatient(String patient) {
    selectedPatient = patient;
    notifyListeners();
  }

  /// select slot
  void selectSlot(String slot) {
    selectedSlot = slot;
    notifyListeners();
  }

  /// check booked
  bool isBooked(String slot) {
    return appointments.any((a) =>
    a.date.year == selectedDate.year &&
        a.date.month == selectedDate.month &&
        a.date.day == selectedDate.day &&
        a.timeSlot == slot);
  }

  /// real time check
  bool isPastSlot(String slot) {

    DateTime now = DateTime.now();

    if (!isSameDay(now, selectedDate)) return false;

    List parts = slot.split(":");

    int hour = int.parse(parts[0]);
    int minute = int.parse(parts[1]);

    DateTime slotTime = DateTime(
      selectedDate.year,
      selectedDate.month,
      selectedDate.day,
      hour,
      minute,
    );

    return slotTime.isBefore(now);
  }

  /// book appointment
  void bookAppointment() {

    if (selectedSlot == null || selectedPatient == null) return;

    appointments.add(
      AppointmentModel(
        date: selectedDate,
        timeSlot: selectedSlot!,
        patientName: selectedPatient!,
      ),
    );

    selectedSlot = null;

    notifyListeners();
  }

}

bool isSameDay(DateTime a, DateTime b) {
  return a.year == b.year &&
      a.month == b.month &&
      a.day == b.day;
}