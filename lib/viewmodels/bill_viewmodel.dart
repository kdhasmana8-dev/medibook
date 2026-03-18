import 'package:flutter/material.dart';

import '../models/biil_model.dart';


class BillViewModel extends ChangeNotifier {

  TextEditingController searchController = TextEditingController();
  TextEditingController billNoController = TextEditingController();
  TextEditingController amountFromController = TextEditingController();
  TextEditingController amountToController = TextEditingController();

  DateTime? fromDate;
  DateTime? toDate;

  List<BillModel> allBills = [
    BillModel(
        billNo: "1001",
        patientName: "John",
        amount: 500,
        date: DateTime(2024,1,10)
    ),

    BillModel(
        billNo: "1002",
        patientName: "Riya",
        amount: 800,
        date: DateTime(2024,2,11)
    ),

    BillModel(
        billNo: "1003",
        patientName: "Rahul",
        amount: 300,
        date: DateTime(2024,3,5)
    ),
  ];

  List<BillModel> filteredBills = [];

  BillViewModel(){
    filteredBills = allBills;
  }

  /// Search by patient
  void searchPatient(){

    String query = searchController.text.toLowerCase();

    filteredBills = allBills
        .where((bill) =>
        bill.patientName.toLowerCase().contains(query))
        .toList();

    notifyListeners();
  }

  /// Advanced Search
  void advancedSearch(){

    filteredBills = allBills.where((bill){

      bool matchBillNo = billNoController.text.isEmpty ||
          bill.billNo.contains(billNoController.text);

      bool matchAmount = true;

      if(amountFromController.text.isNotEmpty){
        matchAmount = bill.amount >=
            double.parse(amountFromController.text);
      }

      if(amountToController.text.isNotEmpty){
        matchAmount = matchAmount &&
            bill.amount <= double.parse(amountToController.text);
      }

      bool matchDate = true;

      if(fromDate != null){
        matchDate = bill.date.isAfter(fromDate!);
      }

      if(toDate != null){
        matchDate = matchDate && bill.date.isBefore(toDate!);
      }

      return matchBillNo && matchAmount && matchDate;

    }).toList();

    notifyListeners();
  }

  /// Clear filters
  void clearFilters(){

    billNoController.clear();
    amountFromController.clear();
    amountToController.clear();

    fromDate = null;
    toDate = null;

    filteredBills = allBills;

    notifyListeners();
  }

}