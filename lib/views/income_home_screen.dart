import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/accounts_viewmodel.dart';

class IncomePage extends StatelessWidget {
  const IncomePage({super.key});

  @override
  Widget build(BuildContext context) {

    var vm = Provider.of<AccountsViewModel>(context);

    return Scaffold(

      body: Column(
        children: [

          /// HEADER
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
                horizontal: 16, vertical: 20),
            decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),

            child: SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  const Text(
                    "Expenses",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  IconButton(
                    icon: const Icon(Icons.sort, color: Colors.white),
                    onPressed: () {

                      showDialog(
                        context: context,
                        builder: (_) {
                          return AlertDialog(
                            title: const Text("Sort By"),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [

                                ListTile(
                                  title: const Text("Date"),
                                  onTap: () {
                                    vm.sortByDate(vm.expenseList);
                                    Navigator.pop(context);
                                  },
                                ),

                                ListTile(
                                  title: const Text("Category"),
                                  onTap: () {
                                    vm.sortByCategory(vm.expenseList);
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  )
                ],
              ),
            ),
          ),

          /// LIST
          Expanded(
            child: ListView.builder(
              itemCount: vm.incomeList.length,
              itemBuilder: (context, index) {

                var item = vm.incomeList[index];

                return Card(
                  child: ListTile(
                    title: Text(item.title),
                    subtitle: Text(item.category),
                    trailing: Text("₹ ${item.amount}"),
                  ),
                );
              },
            ),
          ),
        ],
      ),

      /// ADD INCOME BUTTON
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}