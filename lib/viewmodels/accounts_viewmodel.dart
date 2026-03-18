import 'package:flutter/material.dart';

import '../models/accounts_model.dart';


class AccountsViewModel extends ChangeNotifier {

  List<AccountsModel> incomeList = [
    AccountsModel(
        title: "Patient Bill",
        category: "Consultation",
        amount: 500,
        date: DateTime.now()),
   AccountsModel(
        title: "Dental Treatment",
        category: "Treatment",
        amount: 1200,
        date: DateTime.now()),
  ];

  List<AccountsModel> expenseList = [
   AccountsModel(
        title: "Medicine Purchase",
        category: "Medical",
        amount: 800,
        date: DateTime.now()),
    AccountsModel(
        title: "Electricity Bill",
        category: "Utility",
        amount: 300,
        date: DateTime.now()),
  ];

  double get totalIncome =>
      incomeList.fold(0, (sum, item) => sum + item.amount);

  double get totalExpense =>
      expenseList.fold(0, (sum, item) => sum + item.amount);

  void sortByDate(List<AccountsModel> list) {
    list.sort((a, b) => b.date.compareTo(a.date));
    notifyListeners();
  }

  void sortByCategory(List<AccountsModel> list) {
    list.sort((a, b) => a.category.compareTo(b.category));
    notifyListeners();
  }
}