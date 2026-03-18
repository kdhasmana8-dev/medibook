import 'package:flutter/material.dart';

class DentalChartScreen extends StatefulWidget {
  const DentalChartScreen({super.key});

  @override
  State<DentalChartScreen> createState() => _DentalChartScreenState();
}

class _DentalChartScreenState extends State<DentalChartScreen> {

  /// Toggle Pediatric
  bool pediatric = false;

  /// Adult teeth
  final List<int> adultUpper = [
    18,17,16,15,14,13,12,11,
    21,22,23,24,25,26,27,28
  ];

  final List<int> adultLower = [
    48,47,46,45,44,43,42,41,
    31,32,33,34,35,36,37,38
  ];

  /// Pediatric teeth
  final List<int> pediatricUpper = [
    55,54,53,52,51,
    61,62,63,64,65
  ];

  final List<int> pediatricLower = [
    85,84,83,82,81,
    71,72,73,74,75
  ];

  /// Selected tooth color
  Map<int, Color> toothColor = {};

  /// Root images
  final Map<int, String> rootImages = {

    /// Adult Upper
    18: "assets/images/teethU1.png",
    17: "assets/images/teethU2.png",
    16: "assets/images/teethU3.png",
    15: "assets/images/teethU4.png",
    14: "assets/images/teethU5.png",
    13: "assets/images/teethU6.png",
    12: "assets/images/teethU7.png",
    11: "assets/images/teethU8.png",

    21: "assets/images/teethU9.png",
    22: "assets/images/teethU10.png",
    23: "assets/images/teethU11.png",
    24: "assets/images/teethU12.png",
    25: "assets/images/teethU13.png",
    26: "assets/images/teethU14.png",
    27: "assets/images/teethU15.png",
    28: "assets/images/teethU15.png",

    /// Adult Lower
    48: "assets/images/teethD13.png",
    47: "assets/images/teethD12.png",
    46: "assets/images/teethD12.png",
    45: "assets/images/teethD11.png",
    44: "assets/images/teethD10.png",
    43: "assets/images/teethD10.png",
    42: "assets/images/teethD9.png",
    41: "assets/images/teethD9.png",

    31: "assets/images/teethD8.png",
    32: "assets/images/teethD7.png",
    33: "assets/images/teethD6.png",
    34: "assets/images/teethD5.png",
    35: "assets/images/teethD4.png",
    36: "assets/images/teethD4.png",
    37: "assets/images/teethD2.png",
    38: "assets/images/teethD1.png",

    /// Pediatric Upper
    55: "assets/images/teethU1.png",
    54:"assets/images/teethU2.png",
    53: "assets/images/teethU3.png",
    52: "assets/images/teethU4.png",
    51: "assets/images/teethU5.png",

    61: "assets/images/teethU6.png",
    62: "assets/images/teethU7.png",
    63: "assets/images/teethU12.png",
    64: "assets/images/teethU14.png",
    65: "assets/images/teethU15.png",

    /// Pediatric Lower
    85: "assets/images/teethD13.png",
    84: "assets/images/teethD12.png",
    83: "assets/images/teethD4.png",
    82: "assets/images/teethD4.png",
    81: "assets/images/teethD5.png",

    71: "assets/images/teethD6.png",
    72: "assets/images/teethD7.png",
    73: "assets/images/teethD8.png",
    74: "assets/images/teethD2.png",
    75: "assets/images/teethD1.png",
  };

  /// TOP VIEW IMAGES (same path as root so your assets remain unchanged)
  final Map<int,String> topImages = {
    for (var entry in {
      18,17,16,15,14,13,12,11,
      21,22,23,24,25,26,27,28,
      48,47,46,45,44,43,42,41,
      31,32,33,34,35,36,37,38,
      55,54,53,52,51,
      61,62,63,64,65,
      85,84,83,82,81,
      71,72,73,74,75
    })
      entry : "assets/images/teethno.png"

  };

  /// Tooth selection
  void selectTooth(int number){

    showModalBottomSheet(
      context: context,
      builder: (context){

        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              Text(
                "Tooth $number",
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),

              const SizedBox(height:20),

              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: (){
                  setState(() {
                    toothColor[number] = Colors.blue;
                  });
                  Navigator.pop(context);
                },
                child: const Text("History"),
              ),

              const SizedBox(height:10),

              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                onPressed: (){
                  setState(() {
                    toothColor[number] = Colors.green;
                  });
                  Navigator.pop(context);
                },
                child: const Text("Treatment Done"),
              ),

              const SizedBox(height:10),

              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: (){
                  setState(() {
                    toothColor[number] = Colors.red;
                  });
                  Navigator.pop(context);
                },
                child: const Text("Treatment Planned"),
              ),

            ],
          ),
        );

      },
    );

  }

  /// Root row
  Widget rootRow(List<int> teeth){

    return Row(
      children: teeth.map((t){

        Color color = toothColor[t] ?? Colors.transparent;

        return Expanded(
          child: GestureDetector(
            onTap: (){
              selectTooth(t);
            },
            child: SizedBox(
              height: 65,
              child: Stack(
                alignment: Alignment.center,
                children: [

                  Image.asset(
                    rootImages[t]!,
                    fit: BoxFit.contain,
                  ),

                  if(toothColor[t] != null)
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: color.withOpacity(.35),
                        borderRadius: BorderRadius.circular(6),
                      ),
                    )

                ],
              ),
            ),
          ),
        );

      }).toList(),
    );

  }

  /// Top circular row
  Widget topRow(List<int> teeth){

    return Row(
      children: teeth.map((t){

        Color color = toothColor[t] ?? Colors.transparent;

        return Expanded(
          child: GestureDetector(
            onTap: (){
              selectTooth(t);
            },
            child: SizedBox(
              height: 40,
              child: Stack(
                alignment: Alignment.center,
                children: [

                  Image.asset(
                    topImages[t]!,
                    height: 30,
                  ),

                  if(toothColor[t] != null)
                    Container(
                      height: 26,
                      width: 26,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: color.withOpacity(.4),
                      ),
                    )

                ],
              ),
            ),
          ),
        );

      }).toList(),
    );

  }

  /// Numbers
  Widget numberRow(List<int> teeth){

    return Row(
      children: teeth.map((t){

        return Expanded(
          child: Center(
            child: Text(
              "$t",
              style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey),
            ),
          ),
        );

      }).toList(),
    );

  }

  @override
  Widget build(BuildContext context) {

    List<int> upper = pediatric ? pediatricUpper : adultUpper;
    List<int> lower = pediatric ? pediatricLower : adultLower;

    return Dialog(
      insetPadding: EdgeInsets.zero,
      backgroundColor: Colors.black,

      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.65,

        decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),

        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * .75,

          child: Column(
            children: [

              Container(
                height: 50,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                child: const Center(
                  child: Text(
                    "Dental Chart",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [

                      /// Pediatric checkbox
                      Row(
                        children: [

                          Checkbox(
                            value: pediatric,
                            onChanged: (value){
                              setState(() {
                                pediatric = value!;
                              });
                            },
                          ),

                          const Text(
                            "Pediatric",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height:10),

                      rootRow(upper),
                      const SizedBox(height:6),

                      topRow(upper),
                      const SizedBox(height:6),

                      numberRow(upper),

                      const SizedBox(height:14),

                      numberRow(lower),
                      const SizedBox(height:6),

                      topRow(lower),
                      const SizedBox(height:6),

                      rootRow(lower),


            Wrap(
              alignment: WrapAlignment.center,
              spacing: 20,
              runSpacing: 10,
              children: const [

                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.square,color: Colors.blue,size:14),
                    SizedBox(width:5),
                    Text("History",style: TextStyle(color: Colors.white)),
                  ],
                ),

                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.square,color: Colors.green,size:14),
                    SizedBox(width:5),
                    Text("Treatment Done",style: TextStyle(color: Colors.white)),
                  ],
                ),

                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.square,color: Colors.red,size:14),
                    SizedBox(width:5),
                    Text("Treatment Planned",style: TextStyle(color: Colors.white)),
                  ],
                ),

              ],
            ),

          ],
        ),
      ),
              ),
          ]
        ),
      ),
    ),
    );
  }
}