import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../viewmodels/bill_viewmodel.dart';

class AdvancedSearchDialog extends StatelessWidget {
  const AdvancedSearchDialog({super.key});

  @override
  Widget build(BuildContext context) {

    final vm = Provider.of<BillViewModel>(context);

    return AlertDialog(

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),

      title: const Text("Advanced Search"),

      content: SingleChildScrollView(

        child: Column(

          children: [

            TextField(
              controller: vm.billNoController,
              decoration: const InputDecoration(
                labelText: "Bill No",
              ),
            ),

            const SizedBox(height:10),

            Row(
              children: [

                Expanded(
                  child: TextField(
                    controller: vm.amountFromController,
                    decoration: const InputDecoration(
                      labelText: "Amount From",
                    ),
                  ),
                ),

                const SizedBox(width:10),

                Expanded(
                  child: TextField(
                    controller: vm.amountToController,
                    decoration: const InputDecoration(
                      labelText: "Amount To",
                    ),
                  ),
                ),

              ],
            ),

          ],
        ),
      ),

      actions: [

        TextButton(
          onPressed: (){
            vm.clearFilters();
            Navigator.pop(context);
          },
          child: const Text("Clear"),
        ),

        ElevatedButton(
          onPressed: (){
            vm.advancedSearch();
            Navigator.pop(context);
          },
          child: const Text("Search"),
        )

      ],
    );
  }
}