import 'package:flutter/material.dart';

class BillPage extends StatefulWidget {
  const BillPage({super.key});

  @override
  State<BillPage> createState() => _BillPageState();
}

class _BillPageState extends State<BillPage> {

  final TextEditingController searchController = TextEditingController();

  bool searched = false;

  void searchBill(){
    setState(() {
      searched = true;
    });
  }

  void clearSearch(){
    setState(() {
      searchController.clear();
      searched = false;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff1565C0),
        onPressed: (){},
        child: const Icon(Icons.add),
      ),

      appBar: AppBar(
        title: const Text("Bills"),
        backgroundColor: const Color(0xff1565C0),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [

            /// SEARCH BAR
            TextField(

              controller: searchController,

              onSubmitted: (v){
                searchBill();
              },

              decoration: InputDecoration(

                hintText: "Search by patient name",

                prefixIcon: const Icon(Icons.search),

                suffixIcon: IconButton(

                  icon: const Icon(Icons.tune),

                  onPressed: (){
                    showDialog(
                      context: context,
                      builder: (_) => AdvancedSearchDialog(
                        onClear: clearSearch,
                      ),
                    );
                  },
                ),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),

            const SizedBox(height:30),

            /// EMPTY STATE
            Expanded(
              child: Center(

                child: searched
                    ? const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Icon(
                      Icons.receipt_long,
                      size: 60,
                      color: Colors.grey,
                    ),

                    SizedBox(height:10),

                    Text(
                      "No bills found",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),

                  ],
                )

                    : const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Icon(
                      Icons.search,
                      size: 60,
                      color: Colors.grey,
                    ),

                    SizedBox(height:10),

                    Text(
                      "Search patient to view bills",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),

                  ],
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}


//----------ADVANCED SEARCH DIALOG----------

class AdvancedSearchDialog extends StatefulWidget {

  final VoidCallback onClear;

  const AdvancedSearchDialog({
    super.key,
    required this.onClear,
  });

  @override
  State<AdvancedSearchDialog> createState() => _AdvancedSearchDialogState();
}

class _AdvancedSearchDialogState extends State<AdvancedSearchDialog> {

  final billNoController = TextEditingController();
  final amountFromController = TextEditingController();
  final amountToController = TextEditingController();

  DateTime? fromDate;
  DateTime? toDate;

  @override
  Widget build(BuildContext context) {

    return AlertDialog(

      title: const Text("Advanced Search"),

      content: SingleChildScrollView(

        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            TextField(
              controller: billNoController,
              decoration: const InputDecoration(
                labelText: "Bill No",
              ),
            ),

            TextField(
              controller: amountFromController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Amount From",
              ),
            ),

            TextField(
              controller: amountToController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Amount To",
              ),
            ),

            const SizedBox(height:15),

            ElevatedButton(

              onPressed: () async {

                fromDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2030),
                );

                setState(() {});
              },

              child: Text(
                fromDate == null
                    ? "From Date"
                    : fromDate.toString().split(" ")[0],
              ),
            ),

            ElevatedButton(

              onPressed: () async {

                toDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2030),
                );

                setState(() {});
              },

              child: Text(
                toDate == null
                    ? "To Date"
                    : toDate.toString().split(" ")[0],
              ),
            ),

          ],
        ),
      ),

      actions: [

        TextButton(

          onPressed: (){
            widget.onClear();
            Navigator.pop(context);
          },

          child: const Text("Clear Search"),
        ),

        ElevatedButton(

          onPressed: (){
            Navigator.pop(context);
          },

          child: const Text("Search"),
        ),

      ],
    );
  }
}