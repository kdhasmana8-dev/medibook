import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/prescription_viewmodel.dart';
import '../models/prescription_model.dart';

class PrescriptionHomeScreen extends StatelessWidget {
  const PrescriptionHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (_) => PrescriptionViewModel(),

      child: Scaffold(

        appBar: AppBar(
          title: const Text("Prescriptions"),
          backgroundColor: Colors.blue,
        ),


        body: Consumer<PrescriptionViewModel>(
          builder: (context, vm, child) {

            return Column(
              children: [

                /// SEARCH BAR
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: TextField(
                    controller: vm.searchController,
                    onChanged: vm.searchPrescription,
                    decoration: InputDecoration(
                      hintText: "Search Patient",
                      prefixIcon: const Icon(Icons.search),

                      /// ADVANCED SEARCH ICON
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.tune),
                        onPressed: () {
                          showAdvancedSearch(context);
                        },
                      ),

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),

                /// PRESCRIPTION LIST
                Expanded(
                  child: ListView.builder(
                    itemCount: vm.filteredPrescriptions.length,
                    itemBuilder: (context, index) {

                      PrescriptionModel p =
                      vm.filteredPrescriptions[index];

                      return prescriptionCard(p);
                    },
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  /// PRESCRIPTION CARD UI

  Widget prescriptionCard(PrescriptionModel p) {

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      padding: const EdgeInsets.all(14),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            color: Colors.grey.withOpacity(0.2),
          )
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Text(
                p.patientName,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),

              Text(
                p.date,
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),

          const SizedBox(height: 8),

          Row(
            children: [
              const Icon(Icons.person, size: 16),
              const SizedBox(width: 6),
              Text(p.doctorName),
            ],
          ),

          const SizedBox(height: 8),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const Icon(Icons.medication, size: 16),
              const SizedBox(width: 6),

              Expanded(
                child: Text(p.medicines),
              ),
            ],
          ),

          const SizedBox(height: 8),

          Text(
            "Notes: ${p.notes}",
            style: const TextStyle(color: Colors.grey),
          ),

          const SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [

              TextButton(
                onPressed: () {},
                child: const Text("View"),
              ),

              TextButton(
                onPressed: () {},
                child: const Text("Print"),
              ),
            ],
          )
        ],
      ),
    );
  }
}

//_______ ADVANCED SEARCH FUNCTIONALITY _______
void showAdvancedSearch(BuildContext context) {

  DateTime? fromDate;
  DateTime? toDate;

  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {

      return StatefulBuilder(
        builder: (context, setState) {

          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                const Text(
                  "Advanced Search",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 20),

                /// FROM DATE
                ListTile(
                  leading: const Icon(Icons.date_range),
                  title: Text(
                    fromDate == null
                        ? "Select From Date"
                        : fromDate.toString().split(" ")[0],
                  ),
                  onTap: () async {

                    DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                    );

                    if (picked != null) {
                      setState(() {
                        fromDate = picked;
                      });
                    }
                  },
                ),

                /// TO DATE
                ListTile(
                  leading: const Icon(Icons.date_range),
                  title: Text(
                    toDate == null
                        ? "Select To Date"
                        : toDate.toString().split(" ")[0],
                  ),
                  onTap: () async {

                    DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                    );

                    if (picked != null) {
                      setState(() {
                        toDate = picked;
                      });
                    }
                  },
                ),

                const SizedBox(height: 20),

                /// BUTTONS
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Clear"),
                    ),

                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Search"),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      );
    },
  );
}