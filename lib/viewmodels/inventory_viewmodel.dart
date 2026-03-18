import 'package:flutter/material.dart';
import '../models/inventory_model.dart';

class InventoryViewModel extends ChangeNotifier {

  int currentIndex = 0;

  void changeTab(int index) {
    currentIndex = index;
    notifyListeners();
  }

  List<InventoryModel> inventoryList = [

    InventoryModel(productName: "Paracetamol", qty: 120),
    InventoryModel(productName: "Ibuprofen", qty: 80),
    InventoryModel(productName: "Vitamin C", qty: 60),
    InventoryModel(productName: "Antibiotic", qty: 45),

  ];

}