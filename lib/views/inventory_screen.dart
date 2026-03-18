import 'package:flutter/material.dart';
import 'package:medibook/views/purchase_screen.dart';
import 'package:medibook/views/transcation_screen.dart';
import 'package:provider/provider.dart';
import '../models/inventory_model.dart';
import '../viewmodels/inventory_viewmodel.dart';


class InventoryScreen extends StatelessWidget {
  const InventoryScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (_) => InventoryViewModel(),

      child: Consumer<InventoryViewModel>(
        builder: (context, vm, child) {

          List pages = [
            const InventoryPage(),
            const TransactionPage(),
            const PurchaseOrderPage(),
          ];

          return Scaffold(

            appBar: AppBar(
              title: const Text("Inventory"),
              backgroundColor: Colors.blue,
            ),

            body: pages[vm.currentIndex],

            bottomNavigationBar: BottomNavigationBar(

              currentIndex: vm.currentIndex,
              onTap: vm.changeTab,

              items: const [

                BottomNavigationBarItem(
                    icon: Icon(Icons.inventory),
                    label: "Inventory"),

                BottomNavigationBarItem(
                    icon: Icon(Icons.swap_horiz),
                    label: "Transactions"),

                BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_cart),
                    label: "Purchase Order"),
              ],
            ),
          );
        },
      ),
    );
  }
}

//_____________InventoryPage_____________

class InventoryPage extends StatelessWidget {
  const InventoryPage({super.key});

  @override
  Widget build(BuildContext context) {

    var vm = Provider.of<InventoryViewModel>(context);

    return Scaffold(

      body: Column(
        children: [

          /// HEADER
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            color: Colors.blue.shade50,
            child: const Text(
              "Inventory",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          /// INVENTORY LIST
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: vm.inventoryList.length,

              itemBuilder: (context, index) {

                InventoryModel item = vm.inventoryList[index];

                return Card(
                  child: ListTile(

                    title: Text(item.productName),

                    trailing: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),

                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(.2),
                        borderRadius: BorderRadius.circular(10),
                      ),

                      child: Text(
                        "Qty: ${item.qty}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),

      /// FLOATING ADD BUTTON
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          // Add inventory product
        },
        child: const Icon(Icons.add),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}