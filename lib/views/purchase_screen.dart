import 'package:flutter/material.dart';

class PurchaseOrderPage extends StatelessWidget {
  const PurchaseOrderPage({super.key});

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
              "Purchase Orders",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          /// PURCHASE ORDER LIST
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(12),
              children: const [

                Card(
                  child: ListTile(
                    title: Text("Order #1001"),
                    subtitle: Text("Vitamin C - 100 Qty"),
                    trailing: Text("Pending"),
                  ),
                ),

                Card(
                  child: ListTile(
                    title: Text("Order #1002"),
                    subtitle: Text("Antibiotics - 50 Qty"),
                    trailing: Text("Delivered"),
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
        onPressed: () {
          // Add Purchase Order
        },
        child: const Icon(Icons.add),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}