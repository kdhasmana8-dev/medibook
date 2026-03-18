import 'package:flutter/material.dart';

class TransactionPage extends StatelessWidget {
  const TransactionPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Column(
        children: [

          /// HEADER
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            color: Colors.blue.shade50,
            child: const Text(
              "Transactions",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          /// TRANSACTION LIST
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(12),
              children: const [

                Card(
                  child: ListTile(
                    title: Text("Paracetamol Sold"),
                    subtitle: Text("10 Qty"),
                    trailing: Text("12 Mar 2026"),
                  ),
                ),

                Card(
                  child: ListTile(
                    title: Text("Ibuprofen Added"),
                    subtitle: Text("30 Qty"),
                    trailing: Text("11 Mar 2026"),
                  ),
                ),

              ],
            ),
          ),
        ],
      ),

      /// FLOATING ADD BUTTON
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {},
        child: const Icon(Icons.add),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}