import 'package:flutter/material.dart';
import '../models/quick_bill_model.dart';

class QuickBillViewModel extends ChangeNotifier {

  QuickBillModel bill = QuickBillModel();

  TextEditingController searchController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController treatmentController = TextEditingController();
  TextEditingController medicineController = TextEditingController();

  /// Add Treatment
  void addTreatment() {
    bill.treatment = treatmentController.text;
    bill.fees += 500;
    notifyListeners();
  }

  /// Add Medicine
  void addMedicine() {
    bill.medicine = medicineController.text;
    bill.fees += 200;
    notifyListeners();
  }

  /// Validation
  bool validate() {

    if (searchController.text.isEmpty &&
        mobileController.text.isEmpty &&
        emailController.text.isEmpty) {
      return false;
    }

    return true;
  }

  /// Reset
  void clear() {
    searchController.clear();
    mobileController.clear();
    emailController.clear();
    treatmentController.clear();
    medicineController.clear();
    bill = QuickBillModel();
    notifyListeners();
  }
}