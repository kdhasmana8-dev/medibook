import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/lab_viewmodel.dart';
import 'dental_form_homescreen.dart';

class LabHomePage extends StatelessWidget {
  const LabHomePage({super.key});

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (_) => LabViewModel(),

      child: Scaffold(
        backgroundColor: Colors.white,

        body: Consumer<LabViewModel>(
          builder: (context, vm, child) {

            return Column(
              children: [

                /// HEADER
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 20),
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(18),
                      bottomRight: Radius.circular(18),
                    ),
                  ),

                  child: const SafeArea(
                    child: Text(
                      "Lab Work",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                /// SEARCH BAR
                Padding(
                  padding: const EdgeInsets.all(12),

                  child: TextField(
                    controller: vm.searchController,
                    onChanged: vm.searchLab,

                    decoration: InputDecoration(
                      hintText: "Search Patient",

                      prefixIcon: const Icon(Icons.search),

                      suffixIcon: IconButton(
                        icon: const Icon(Icons.tune),

                        onPressed: () {

                          showDialog(
                            context: context,
                            builder: (_) {

                              return AlertDialog(
                                title:
                                const Text("Advanced Search"),

                                content: Column(
                                  mainAxisSize:
                                  MainAxisSize.min,
                                  children: [

                                    TextField(
                                      decoration:
                                      const InputDecoration(
                                        labelText:
                                        "Patient Name",
                                      ),
                                    ),

                                    const SizedBox(height: 10),

                                    TextField(
                                      decoration:
                                      const InputDecoration(
                                        labelText:
                                        "Test Type",
                                      ),
                                    ),

                                    const SizedBox(height: 10),

                                    TextField(
                                      decoration:
                                      const InputDecoration(
                                        labelText:
                                        "Date Range",
                                      ),
                                    ),
                                  ],
                                ),

                                actions: [

                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text("Clear")),

                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text("Search")),
                                ],
                              );
                            },
                          );
                        },
                      ),

                      border: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),

                /// LAB LIST
                Expanded(
                  child: ListView.builder(

                    itemCount: vm.filteredList.length,

                    itemBuilder: (context, index) {

                      var lab = vm.filteredList[index];

                      return Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),

                        padding: const EdgeInsets.all(14),

                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                          BorderRadius.circular(12),

                          boxShadow: [
                            BoxShadow(
                              blurRadius: 5,
                              color: Colors.grey
                                  .withOpacity(.2),
                            )
                          ],
                        ),

                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [

                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment
                                  .spaceBetween,

                              children: [

                                Text(
                                  lab.patientName,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight:
                                      FontWeight.bold),
                                ),

                                Text(lab.date),
                              ],
                            ),

                            const SizedBox(height: 8),

                            Text("Test: ${lab.testName}"),

                            const SizedBox(height: 6),

                            Text(
                              "Status: ${lab.status}",
                              style: TextStyle(
                                color: lab.status ==
                                    "Completed"
                                    ? Colors.green
                                    : Colors.orange,
                              ),
                            ),

                            const SizedBox(height: 6),

                            Text(
                              "Amount: ₹${lab.amount}",
                              style: const TextStyle(
                                  fontWeight:
                                  FontWeight.bold),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            );
          },
        ),

        /// FLOATING BUTTON
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,

          onPressed: () {

            Navigator.push(context,
                MaterialPageRoute(builder: (
                    context) => const DentalLabScreen()));
          },

          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}