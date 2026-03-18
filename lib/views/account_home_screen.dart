import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/accounts_viewmodel.dart';
import 'expenses_home_screen.dart';
import 'income_home_screen.dart';

class AccountsPage extends StatelessWidget {
  const AccountsPage({super.key});

  @override
  Widget build(BuildContext context) {

    var vm = Provider.of<AccountsViewModel>(context);

    return Scaffold(
      backgroundColor: Colors.white,

      body: Column(
        children: [

          /// HEADER 
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
                horizontal: 16, vertical: 22),
            decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(18),
                bottomRight: Radius.circular(18),
              ),
            ),

            child: const SafeArea(
              child: Text(
                "Accounts",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),

          const SizedBox(height: 30),

          /// INCOME CARD
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),

            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  blurRadius: 8,
                  color: Colors.grey.withOpacity(.2),
                  offset: const Offset(0, 3),
                )
              ],
            ),

            child: ListTile(

              contentPadding: const EdgeInsets.symmetric(
                  horizontal: 18, vertical: 12),

              leading: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(.15),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.arrow_downward,
                  color: Colors.green,
                ),
              ),

              title: const Text(
                "Income",
                style: TextStyle(
                    fontWeight: FontWeight.bold),
              ),

              subtitle: Text(
                "₹ ${vm.totalIncome.toStringAsFixed(0)}",
                style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black87),
              ),

              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),

              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const IncomePage(),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 18),

          /// EXPENSE CARD
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),

            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  blurRadius: 8,
                  color: Colors.grey.withOpacity(.2),
                  offset: const Offset(0, 3),
                )
              ],
            ),

            child: ListTile(

              contentPadding: const EdgeInsets.symmetric(
                  horizontal: 18, vertical: 12),

              leading: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(.15),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.arrow_upward,
                  color: Colors.red,
                ),
              ),

              title: const Text(
                "Expenses",
                style: TextStyle(
                    fontWeight: FontWeight.bold),
              ),

              subtitle: Text(
                "₹ ${vm.totalExpense.toStringAsFixed(0)}",
                style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black87),
              ),

              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),

              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ExpensePage(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}