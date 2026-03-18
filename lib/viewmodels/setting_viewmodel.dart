import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../models/setting_models.dart';

class SettingsViewModel extends ChangeNotifier {
  final String doctorName = "Dr.Kaushal";
  final String profileSubtitle = "Edit Profile";

  // General Settings
  List<SettingItem> generalSettings = [];

  // Preferences
  List<SettingItem> preferences = [];

  // Users
  List<SettingItem> users = [];

  // Masters
  List<SettingItem> masters = [];

  // Communication
  List<SettingItem> communication = [];

  // Add-ons
  List<SettingItem> addons = [];

  SettingsViewModel() {
    _initSettings();
  }

  void _initSettings() {
    generalSettings = [
      SettingItem(
          title: "Clinic Info",
          icon: Icons.local_hospital,
          onTap: () {/* Navigate to Clinic Page */}),
      SettingItem(
          title: "Online Payment",
          icon: Icons.payment,
          onTap: () {/* Navigate to Payment Page */}),
      SettingItem(
          title: "Appointment Booking",
          icon: Icons.calendar_today,
          onTap: () {/* Navigate to Booking Page */}),
    ];

    preferences = [
      SettingItem(
          title: "Account Level", isToggle: true, onTap: () {
        // Toggle logic if needed
      }),
    ];

    users = [
      SettingItem(
          title: "Practicing Staff",
          onTap: () {/* Navigate */}),
      SettingItem(
          title: "Receptionist",
          onTap: () {/* Navigate */}),
    ];

    masters = [
      SettingItem(title: "Treatment", onTap: () {}),
      SettingItem(title: "Complaints", onTap: () {}),
      SettingItem(title: "Observation", onTap: () {}),
      SettingItem(title: "Diagnosis", onTap: () {}),
      SettingItem(title: "Investigation", onTap: () {}),
      SettingItem(title: "Product Medicines", onTap: () {}),
      SettingItem(title: "Medicines Templates", onTap: () {}),
      SettingItem(title: "Labs", onTap: () {}),
    ];

    communication = [
      SettingItem(title: "Patient Feedback", onTap: () {}),
    ];

    addons = [
      SettingItem(title: "Category Master", onTap: () {}),
      SettingItem(title: "Some Other Category", onTap: () {}),
    ];
  }
}