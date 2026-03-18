import 'package:flutter/material.dart';

class AddVisitScreen extends StatefulWidget {
  const AddVisitScreen({super.key});

  @override
  State<AddVisitScreen> createState() => _AddVisitScreenState();
}

class _AddVisitScreenState extends State<AddVisitScreen> {

  TextEditingController treatmentController = TextEditingController();
  TextEditingController medicineController = TextEditingController();

  double fees = 0;
  double discount = 0;

  bool clinicalOpen = false;
  bool suggestedOpen = false;
  bool documentOpen = false;
  bool vitalOpen = false;
  bool adviceOpen = false;

  @override
  Widget build(BuildContext context) {

    double total = fees - discount;

    return Scaffold(

      backgroundColor: Colors.grey.shade200,

      appBar: AppBar(
        backgroundColor: const Color(0xFF1565C0),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Center(
              child: Text(
                "Karisma",
                style: TextStyle(fontSize: 16),
              ),
            ),
          )
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [

              /// TOP CARD
              _card(
                Column(
                  children: [

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Row(
                          children: [
                            Text("14/03/2026"),
                            SizedBox(width: 10),
                            Icon(Icons.calendar_month)
                          ],
                        ),
                        Row(
                          children: [
                            Text("10:09 AM"),
                            SizedBox(width: 10),
                            Icon(Icons.access_time)
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    Row(
                      children: const [
                        Text("Doctor: ",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("Karishma Dhasmana"),
                        Icon(Icons.arrow_drop_down)
                      ],
                    ),

                    const SizedBox(height: 10),

                    const TextField(
                      decoration: InputDecoration(
                        hintText: "Search Patient or Add New",
                      ),
                    ),

                    const SizedBox(height: 10),

                    const TextField(
                      decoration: InputDecoration(
                        hintText: "Demo Patient",
                      ),
                    )
                  ],
                ),
              ),

              const SizedBox(height: 10),

              /// CLINICAL NOTES
              _expandTile("Clinical Notes", clinicalOpen, () {
                setState(() {
                  clinicalOpen = !clinicalOpen;
                });
              }),

              const SizedBox(height: 10),

              /// TREATMENT SECTION
              _card(
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    const Text(
                      "Treatment:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),

                    Row(
                      children: [

                        Expanded(
                          child: TextField(
                            controller: treatmentController,
                          ),
                        ),

                        const SizedBox(width: 10),

                        OutlinedButton(
                          onPressed: () {
                            setState(() {
                              fees += 500;
                            });
                          },
                          child: const Text("Add"),
                        )
                      ],
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      "Medicine:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),

                    Row(
                      children: [

                        Expanded(
                          child: TextField(
                            controller: medicineController,
                          ),
                        ),

                        const SizedBox(width: 10),

                        OutlinedButton(
                          onPressed: () {},
                          child: const Text("Add"),
                        )
                      ],
                    ),

                    const SizedBox(height: 20),

                    /// FEES
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Fees:"),
                        Text(fees.toString())
                      ],
                    ),

                    const SizedBox(height: 10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Discount:"),
                        SizedBox(
                          width: 120,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            onChanged: (v) {
                              discount = double.tryParse(v) ?? 0;
                              setState(() {});
                            },
                          ),
                        )
                      ],
                    ),

                    const Divider(),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Total:",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          total.toString(),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              _expandTile("Treatment Suggested", suggestedOpen, () {
                setState(() {
                  suggestedOpen = !suggestedOpen;
                });
              }),

              const SizedBox(height: 10),

              _expandTile("Documents", documentOpen, () {
                setState(() {
                  documentOpen = !documentOpen;
                });
              }),

              const SizedBox(height: 10),

              _expandTile("Vital Signs", vitalOpen, () {
                setState(() {
                  vitalOpen = !vitalOpen;
                });
              }),

              const SizedBox(height: 10),

              _expandTile("Advice & Follow Up", adviceOpen, () {
                setState(() {
                  adviceOpen = !adviceOpen;
                });
              }),

              const SizedBox(height: 20),

              /// SUBMIT BUTTON
              SizedBox(
                width: 150,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1565C0),
                    padding: const EdgeInsets.all(15),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Visit Submitted")),
                    );
                  },
                  child: const Text("Submit"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  /// CARD WIDGET
  Widget _card(Widget child) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade400),
      ),
      child: child,
    );
  }

  /// EXPAND TILE
  Widget _expandTile(String title, bool open, Function() tap) {
    return InkWell(
      onTap: tap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade400),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,
                style:
                const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const Icon(Icons.add)
          ],
        ),
      ),
    );
  }
}