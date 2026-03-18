import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/quick_bill_viewmodel.dart';

class QuickBillScreen extends StatelessWidget {
  const QuickBillScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final vm = Provider.of<QuickBillViewModel>(context);

    return Scaffold(

      backgroundColor: const Color(0xffF4F6FA),

      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xff1565C0),
        title: const Text("Quick Bill"),
      ),

      body: SingleChildScrollView(

        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// PATIENT SECTION
            _sectionTitle("Patient Details"),

            const SizedBox(height: 10),

            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),

                child: Column(
                  children: [

                    TextField(
                      controller: vm.searchController,
                      decoration: InputDecoration(
                        hintText: "Search Patient or Add New",
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    Row(
                      children: [

                        Expanded(
                          child: TextField(
                            controller: vm.mobileController,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              hintText: "Mobile No.",
                              prefixIcon: const Icon(Icons.phone),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(width: 10),

                        Expanded(
                          child: TextField(
                            controller: vm.emailController,
                            decoration: InputDecoration(
                              hintText: "Email ID",
                              prefixIcon: const Icon(Icons.email),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),

                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// TREATMENT
            _sectionTitle("Treatment"),

            const SizedBox(height: 10),

            Row(
              children: [

                Expanded(
                  child: TextField(
                    controller: vm.treatmentController,
                    decoration: InputDecoration(
                      hintText: "Treatment",
                      prefixIcon: const Icon(Icons.medical_services),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 10),

                ElevatedButton.icon(
                  onPressed: vm.addTreatment,
                  icon: const Icon(Icons.add),
                  label: const Text("Add"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff1565C0),
                    minimumSize: const Size(80, 55),
                  ),
                ),

              ],
            ),

            const SizedBox(height: 20),

            /// MEDICINE
            _sectionTitle("Medicine"),

            const SizedBox(height: 10),

            Row(
              children: [

                Expanded(
                  child: TextField(
                    controller: vm.medicineController,
                    decoration: InputDecoration(
                      hintText: "Medicine",
                      prefixIcon: const Icon(Icons.medication),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 10),

                ElevatedButton.icon(
                  onPressed: vm.addMedicine,
                  icon: const Icon(Icons.add),
                  label: const Text("Add"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff1565C0),
                    minimumSize: const Size(80, 55),
                  ),
                ),

              ],
            ),

            const SizedBox(height: 30),

            /// BILL SUMMARY
            _sectionTitle("Bill Summary"),

            const SizedBox(height: 10),

            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),

                child: Column(
                  children: [

                    _summaryRow("Fees", vm.bill.fees),

                    const SizedBox(height: 10),

                    _summaryRow("Discount", vm.bill.discount),

                    const Divider(height: 30),

                    _summaryRow(
                      "Total",
                      vm.bill.total,
                      isBold: true,
                    ),

                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            /// SUBMIT BUTTON
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(

                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff1565C0),
                  minimumSize: const Size(160, 55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),

                onPressed: () {

                  if (!vm.validate()) {

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Please enter at least one field",
                        ),
                      ),
                    );

                    return;
                  }

                  vm.clear();

                },

                child: const Text(
                  "Submit",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }

  /// SECTION TITLE
  static Widget _sectionTitle(String text){
    return Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  /// SUMMARY ROW
  static Widget _summaryRow(String title, dynamic value,
      {bool isBold = false}) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        Text(
          title,
          style: TextStyle(
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),

        Text(
          "$value",
          style: TextStyle(
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            fontSize: isBold ? 16 : 14,
          ),
        ),

      ],
    );
  }
}