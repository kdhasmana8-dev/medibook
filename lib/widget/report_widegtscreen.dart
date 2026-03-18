import 'package:flutter/material.dart';
import '../models/report_model.dart';

class ReportTile extends StatelessWidget {

  final ReportModel report;
  final Function onTap;

  const ReportTile({
    super.key,
    required this.report,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [

        GestureDetector(
          onTap: () => onTap(),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 6),
            padding: const EdgeInsets.all(14),
            color: Colors.grey.shade200,
            child: Row(
              children: [

                Icon(
                  report.isExpanded ? Icons.remove : Icons.add,
                  size: 20,
                ),

                const SizedBox(width: 10),

                Text(
                  report.title,
                  style: const TextStyle(fontSize: 16),
                )
              ],
            ),
          ),
        ),

        if (report.isExpanded)
          Container(
            padding: const EdgeInsets.all(12),
            color: Colors.white,
            child: Column(
              children: [

                Row(
                  children: [

                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: "From date",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),

                    const SizedBox(width: 10),

                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: "To date",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                ElevatedButton(
                  onPressed: () {},
                  child: const Text("GENERATE"),
                )
              ],
            ),
          )
      ],
    );
  }
}