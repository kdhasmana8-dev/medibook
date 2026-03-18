import 'package:flutter/material.dart';

class BusinessCategorySheet extends StatefulWidget {
  const BusinessCategorySheet({super.key});

  @override
  State<BusinessCategorySheet> createState() =>
      _BusinessCategorySheetState();
}

class _BusinessCategorySheetState
    extends State<BusinessCategorySheet> {

  List<String> categories = [
    "Doctors / Clinics / Medical",
    "Exercises (Zumba, Pilates, Yoga)",
    "Gym & Fitness centre",
    "Hospital",
    "Insurance Advisor",
    "Lawyer",
    "Library & Books Management",
    "Milk, Egg & Daily Needs Supplier",
    "News Paper Supplier",
    "NGO / Trust",
    "Personal Trainer",
    "Pest Control",
    "Photographer",
    "Playschool",
    "Real Estate Consultant",
    "Repair & Maintenance Service",
    "Retail",
    "School / College",
    "Tattoo Artist",
    "Tiffin Services",
    "Training Institute",
  ];

  String search = "";

  @override
  Widget build(BuildContext context) {

    List<String> filtered = categories
        .where((e) =>
        e.toLowerCase().contains(search.toLowerCase()))
        .toList();

    return SizedBox(
      height: 600,
      child: Column(
        children: [

          /// HEADER
          Container(
            padding: const EdgeInsets.all(16),
            color: Color(0xFF1565C0),
            child: Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
              children: [

                const Text(
                  "Business Category",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),

                IconButton(
                  icon: const Icon(Icons.close,
                      color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ),

          /// SEARCH
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(

              onChanged: (value) {
                setState(() {
                  search = value;
                });
              },

              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "Search here",
                border: UnderlineInputBorder(),
              ),
            ),
          ),

          const Divider(),

          /// CATEGORY LIST
          Expanded(
            child: ListView.builder(

              itemCount: filtered.length,

              itemBuilder: (context, index) {

                return Column(
                  children: [

                    ListTile(
                      title: Text(
                        filtered[index],
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black87),
                      ),

                      onTap: () {

                        /// RETURN VALUE
                        Navigator.pop(context, filtered[index]);
                      },
                    ),

                    const Divider(height: 1)
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}