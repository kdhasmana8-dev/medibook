import 'package:flutter/material.dart';


class DentalLabScreen extends StatefulWidget {
  const DentalLabScreen({super.key});

  @override
  State<DentalLabScreen> createState() => _DentalLabScreenState();
}

class _DentalLabScreenState extends State<DentalLabScreen> {

  Map<int, String> toothImages = {

    /// Upper Adult
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

    /// Lower Adult
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

    /// Pediatric
    55: "assets/images/teethU1.png",
    54: "assets/images/teethU2.png",
    53: "assets/images/teethU3.png",
    52: "assets/images/teethU4.png",
    51: "assets/images/teethU5.png",

    61: "assets/images/teethU6.png",
    62: "assets/images/teethU7.png",
    63: "assets/images/teethU12.png",
    64: "assets/images/teethU14.png",
    65: "assets/images/teethU15.png",

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

  bool pediatric = false;

  /// SEARCH / HEADER CONTROLLERS
  TextEditingController searchPatient = TextEditingController();
  TextEditingController doctorName = TextEditingController();
  TextEditingController labName = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  bool crown = false;
  bool bridge = false;
  bool inlay = false;
  bool onlay = false;
  bool veneer = false;
  bool postCore = false;
  bool denture = false;

  bool smooth = false;
  bool course = false;
  bool glossy = false;

  bool ovate = false;
  bool ridgeLap = false;
  bool modifiedRidge = false;
  bool sanitary = false;

  bool screwRetained = false;
  bool cementRetained = false;
  bool others = false;

  String deliveryStatus = "Handover to Lab";

  TextEditingController metalTrial = TextEditingController();
  TextEditingController bisqueTrial = TextEditingController();
  TextEditingController finalDate = TextEditingController();

  TextEditingController qty = TextEditingController();
  TextEditingController rate = TextEditingController();
  TextEditingController tax = TextEditingController();
  TextEditingController discount = TextEditingController();

  double total = 0;

  List<int> selectedTeeth = [];

  /// DATE PICKER
  Future pickDate(TextEditingController controller) async {
    DateTime? picked = await showDatePicker(
        context: context,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
        initialDate: DateTime.now());

    if (picked != null) {
      controller.text = "${picked.day}/${picked.month}/${picked.year}";
    }
  }

  /// TIME PICKER
  Future pickTime() async {
    TimeOfDay? picked =
    await showTimePicker(context: context, initialTime: TimeOfDay.now());

    if (picked != null) {
      timeController.text = picked.format(context);
    }
  }

  void calculateTotal() {
    double q = double.tryParse(qty.text) ?? 0;
    double r = double.tryParse(rate.text) ?? 0;
    double t = double.tryParse(tax.text) ?? 0;
    double d = double.tryParse(discount.text) ?? 0;

    setState(() {
      total = (q * r) + t - d;
    });
  }

  Widget sectionTitle(String title) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      color: Colors.blue,
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
    );
  }

  Widget sectionCard({required String title, required Widget child}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        children: [
          sectionTitle(title),
          Padding(
            padding: const EdgeInsets.all(12),
            child: child,
          )
        ],
      ),
    );
  }

  Widget checkbox(String title, bool value, Function(bool?) onChanged) {
    return Row(
      children: [
        Checkbox(value: value, onChanged: onChanged),
        Text(title)
      ],
    );
  }

  Widget chargeField(String title, TextEditingController controller) {
    return Row(
      children: [
        Expanded(child: Text(title)),
        Expanded(
          child: TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            onChanged: (_) => calculateTotal(),
          ),
        )
      ],
    );
  }

  /// TOOTH WIDGET
  Widget toothWidget(int number) {

    bool selected = selectedTeeth.contains(number);

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            if (selected) {
              selectedTeeth.remove(number);
            } else {
              selectedTeeth.add(number);
            }
          });
        },

        child: SizedBox(
          height: 60,

          child: Stack(
            alignment: Alignment.center,
            children: [

              Image.asset(
                toothImages[number] ?? "assets/images/teethno.png",
                height: 50,
                fit: BoxFit.contain,
                color: selected ? Colors.green.withOpacity(.5) : null,
                colorBlendMode: selected ? BlendMode.srcATop : null,
              ),

            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    List<int> adultUpper = [
      18,17,16,15,14,13,12,11,
      21,22,23,24,25,26,27,28
    ];

    List<int> adultLower = [
      48,47,46,45,44,43,42,41,
      31,32,33,34,35,36,37,38
    ];

    List<int> childUpper = [
      55,54,53,52,51,
      61,62,63,64,65
    ];

    List<int> childLower = [
      85,84,83,82,81,
      71,72,73,74,75
    ];

    List<int> upperTeeth = pediatric ? childUpper : adultUpper;
    List<int> lowerTeeth = pediatric ? childLower : adultLower;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Dental Lab"),
        backgroundColor: Colors.blueAccent,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),

        child: Column(
          children: [

            /// SEARCH PATIENT
            sectionCard(
              title: "Search Patient",
              child: TextField(
                controller: searchPatient,
                decoration: const InputDecoration(
                  hintText: "Search Patient Name / ID",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            /// DOCTOR / LAB DETAILS
            sectionCard(
              title: "Doctor & Lab Details",
              child: Column(
                children: [

                  TextField(
                    controller: doctorName,
                    decoration: const InputDecoration(
                        labelText: "Doctor Name"),
                  ),

                  const SizedBox(height:10),

                  TextField(
                    controller: labName,
                    decoration: const InputDecoration(
                        labelText: "Creditor / Lab"),
                  ),

                  const SizedBox(height:10),

                  Row(
                    children: [

                      Expanded(
                        child: TextField(
                          controller: dateController,
                          readOnly: true,
                          decoration:
                          const InputDecoration(labelText: "Date"),
                        ),
                      ),

                      IconButton(
                          onPressed: () => pickDate(dateController),
                          icon: const Icon(Icons.calendar_today))
                    ],
                  ),

                  Row(
                    children: [

                      Expanded(
                        child: TextField(
                          controller: timeController,
                          readOnly: true,
                          decoration:
                          const InputDecoration(labelText: "Time"),
                        ),
                      ),

                      IconButton(
                          onPressed: pickTime,
                          icon: const Icon(Icons.access_time))
                    ],
                  )
                ],
              ),
            ),

            /// DENTAL CHART (UNCHANGED STYLE)
            sectionCard(
              title: "Dental Chart",
              child: Container(
                color: Colors.black,
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [

                    /// Pediatric Checkbox
                    Row(
                      children: [
                        Checkbox(
                          value: pediatric,
                          checkColor: Colors.black,
                          activeColor: Colors.white,
                          onChanged: (v){
                            setState(() {
                              pediatric = v!;
                            });
                          },
                        ),
                        const Text(
                          "Pediatric",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),

                    const SizedBox(height: 10),

                    /// UPPER ROOT IMAGES
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: upperTeeth.map((e) => toothWidget(e)).toList(),
                    ),

                    const SizedBox(height: 6),

                    /// UPPER NUMBERS
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: upperTeeth.map((e){
                        return Expanded(
                          child: Center(
                            child: Text(
                              "$e",
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),

                    const SizedBox(height: 10),

                    /// LOWER NUMBERS
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: lowerTeeth.map((e){
                        return Expanded(
                          child: Center(
                            child: Text(
                              "$e",
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),

                    const SizedBox(height: 6),

                    /// LOWER ROOT IMAGES
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: lowerTeeth.map((e) => toothWidget(e)).toList(),
                    ),

                    const SizedBox(height: 12),

                    Text(
                      selectedTeeth.isEmpty
                          ? "Selected Teeth : Not selected"
                          : "Selected Teeth : ${selectedTeeth.join(", ")}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                  ],
                ),
              ),
            ),

            /// Type of Prosthesis
            sectionCard(
              title: "Type of Prosthesis",
              child: Column(
                children: [

                  checkbox("Crown", crown,
                          (v)=>setState(()=>crown=v!)),

                  checkbox("Bridge", bridge,
                          (v)=>setState(()=>bridge=v!)),

                  checkbox("Inlay", inlay,
                          (v)=>setState(()=>inlay=v!)),

                  checkbox("Onlay", onlay,
                          (v)=>setState(()=>onlay=v!)),

                  checkbox("Veneer", veneer,
                          (v)=>setState(()=>veneer=v!)),

                  checkbox("Post & Core", postCore,
                          (v)=>setState(()=>postCore=v!)),

                  checkbox("Denture", denture,
                          (v)=>setState(()=>denture=v!)),

                ],
              ),
            ),

            /// Surface Cluster
            sectionCard(
              title: "Surface Cluster",
              child: Column(
                children: [

                  checkbox("Smooth", smooth,
                          (v)=>setState(()=>smooth=v!)),

                  checkbox("Course", course,
                          (v)=>setState(()=>course=v!)),

                  checkbox("Glossy", glossy,
                          (v)=>setState(()=>glossy=v!)),

                ],
              ),
            ),

            /// Pontic Type
            sectionCard(
              title: "Pontic Type",
              child: Column(
                children: [

                  checkbox("Ovate", ovate,
                          (v)=>setState(()=>ovate=v!)),

                  checkbox("Ridge Lap", ridgeLap,
                          (v)=>setState(()=>ridgeLap=v!)),

                  checkbox("Modified Ridge Lap", modifiedRidge,
                          (v)=>setState(()=>modifiedRidge=v!)),

                  checkbox("Sanitary", sanitary,
                          (v)=>setState(()=>sanitary=v!)),

                ],
              ),
            ),

            /// Implant
            sectionCard(
              title: "Implant",
              child: Column(
                children: [

                  checkbox("Screw Retained", screwRetained,
                          (v)=>setState(()=>screwRetained=v!)),

                  checkbox("Cement Retained", cementRetained,
                          (v)=>setState(()=>cementRetained=v!)),

                  checkbox("Others", others,
                          (v)=>setState(()=>others=v!)),

                ],
              ),
            ),

            /// Delivery Date
            sectionCard(
              title: "Expected Delivery Date",
              child: Column(
                children: [

                  Row(
                    children: [

                      const Expanded(child: Text("Metal Trial")),

                      Expanded(
                        child: TextField(
                          controller: metalTrial,
                          readOnly: true,
                          decoration: const InputDecoration(
                              hintText: "DD/MM/YYYY"),
                        ),
                      ),

                      IconButton(
                          icon: const Icon(Icons.calendar_today),
                          onPressed: ()=>pickDate(metalTrial))

                    ],
                  ),

                  Row(
                    children: [

                      const Expanded(child: Text("Bisque Trial")),

                      Expanded(
                        child: TextField(
                          controller: bisqueTrial,
                          readOnly: true,
                          decoration: const InputDecoration(
                              hintText: "DD/MM/YYYY"),
                        ),
                      ),

                      IconButton(
                          icon: const Icon(Icons.calendar_today),
                          onPressed: ()=>pickDate(bisqueTrial))

                    ],
                  ),

                  Row(
                    children: [

                      const Expanded(child: Text("Final")),

                      Expanded(
                        child: TextField(
                          controller: finalDate,
                          readOnly: true,
                          decoration: const InputDecoration(
                              hintText: "DD/MM/YYYY"),
                        ),
                      ),

                      IconButton(
                          icon: const Icon(Icons.calendar_today),
                          onPressed: ()=>pickDate(finalDate))

                    ],
                  ),

                ],
              ),
            ),

            /// Charges
            sectionCard(
              title: "Charges",
              child: Column(
                children: [

                  chargeField("Quantity", qty),
                  chargeField("Rate", rate),
                  chargeField("Tax", tax),
                  chargeField("Discount", discount),

                  const SizedBox(height:10),

                  Row(
                    children: [

                      const Expanded(child: Text("Total")),

                      Expanded(
                        child: Text(
                          total.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold),
                        ),
                      )

                    ],
                  )

                ],
              ),
            ),

            /// Status
            Row(
              children: [

                const Text("Work Delivery Status"),

                const SizedBox(width:20),

                DropdownButton<String>(
                  value: deliveryStatus,
                  items: const [

                    DropdownMenuItem(
                        value: "Handover to Lab",
                        child: Text("Handover to Lab")),

                    DropdownMenuItem(
                        value: "In Progress",
                        child: Text("In Progress")),

                    DropdownMenuItem(
                        value: "Completed",
                        child: Text("Completed")),

                  ],
                  onChanged: (v){

                    setState(() {
                      deliveryStatus = v!;
                    });

                  },
                )

              ],
            ),

            const SizedBox(height:20),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(
                    horizontal: 60, vertical: 15),
              ),
              onPressed: () {

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text("Form Submitted")),
                );

              },
              child: const Text("Submit"),
            ),

            const SizedBox(height:30)

          ],
        ),
      ),
    );
  }
}