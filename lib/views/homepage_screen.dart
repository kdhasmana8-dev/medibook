import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:medibook/views/animation_screen.dart';
import 'package:medibook/views/lab_home_screen.dart';
import 'package:medibook/views/prescription_home_screen.dart';
import 'package:medibook/views/quick_bill_screen.dart';
import 'package:medibook/views/report_homescreen.dart';
import 'package:medibook/views/setting_screen.dart';
import 'package:medibook/views/terms_policy_screen.dart';

import 'account_home_screen.dart';
import 'appointment_uiscreen.dart';
import 'biil_homescreen.dart';
import 'campaign_screen.dart';
import 'dashboard/appointment_screen.dart';
import 'dashboard/missed_appointment_screen.dart';
import 'dashboard/new_patient_screen.dart';
import 'dashboard/patient_page_screen.dart';
import 'dashboard/patient_visit_screen.dart';
import 'inventory_screen.dart';


class DoctorDashboard extends StatefulWidget {
  const DoctorDashboard({super.key});

  @override
  State<DoctorDashboard> createState() => _DoctorDashboardState();
}
class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen>
    with SingleTickerProviderStateMixin {

  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  Widget appointmentCard(String name, String time, String status, Color color) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color.withOpacity(0.15),
      ),
      child: Row(
        children: [

          CircleAvatar(
            backgroundColor: color,
            child: const Icon(Icons.person, color: Colors.white),
          ),

          const SizedBox(width: 10),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 14),
                ),

                const SizedBox(height: 4),

                Text("Time : $time"),
              ],
            ),
          ),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              status,
              style: const TextStyle(color: Colors.white, fontSize: 11),
            ),
          )
        ],
      ),
    );
  }

  Widget appointmentList(String status, Color color) {
    return ListView(
      children: [

        appointmentCard("Rahul Sharma", "10:30 AM", status, color),
        appointmentCard("Priya Singh", "11:00 AM", status, color),
        appointmentCard("Amit Patel", "11:30 AM", status, color),
        appointmentCard("Neha Gupta", "12:00 PM", status, color),

      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Container(
          color: Colors.white,
          child: TabBar(
            controller: tabController,
            labelColor: Colors.teal,
            indicatorColor: Colors.teal,
            unselectedLabelColor: Colors.grey,
            tabs: const [

              Tab(text: "Appointments"),
              Tab(text: "Checked In"),
              Tab(text: "Engaged"),
              Tab(text: "Completed"),

            ],
          ),
        ),

        Expanded(
          child: TabBarView(
            controller: tabController,
            children: [

              appointmentList("Appointment", Colors.orange),

              appointmentList("Checked In", Colors.blue),

              appointmentList("Engaged", Colors.purple),

              appointmentList("Completed", Colors.green),

            ],
          ),
        )

      ],
    );
  }
}


class _DoctorDashboardState extends State<DoctorDashboard>
    with SingleTickerProviderStateMixin {

  late TabController tabController;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final FocusNode searchFocus = FocusNode();
  String dateRange = "";
  void showAddMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              buildAddItem(Icons.person, "Add Patient"),
              buildAddItem(Icons.calendar_today, "Add Appointment"),
              buildAddItem(Icons.directions_walk, "Add Walk In"),
              buildAddItem(Icons.currency_rupee, "Add Payment"),

            ],
          ),
        );
      },
    );
  }
  @override
  void dispose() {
    super.dispose();
    searchFocus.unfocus();
  }
  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 2, vsync: this);

    DateTime now = DateTime.now();

    dateRange =
    "${now.day.toString().padLeft(2, '0')}/${now.month.toString().padLeft(
        2, '0')}/${now.year}";
  }

  List menuItems = [
    {
      "title": "Patients",
      "image": "assets/images/pic.jpg",
      "page": const PatientDetailScreen()
    },
    {
      "title": "Appointments",
      "image": "assets/images/pic3.jpg",
      "page": const AppointmentPage()
    },
    {
      "title": "Billing",
      "image": "assets/images/pic2.jpg",
      "page": const BillPage()
    },
    {
      "title": "Settings",
      "image": "assets/images/pic.jpg",
      "page": const SettingsScreen()
    },
    {
      "title": "Accounts",
      "image": "assets/images/pic2.jpg",
      "page": const AccountsPage()
    },
    {
      "title": "Campaign",
      "image": "assets/images/pic6.jpg",
      "page": const CampaignPage()
    },
    {
      "title": "Reports",
      "image": "assets/images/pic3.jpg",
      "page": const ReportsScreen()
    },
    {
      "title": "Prescription",
      "image": "assets/images/pic4.jpg",
      "page": const PrescriptionHomeScreen()
    },
    {
      "title": "Inventory",
      "image": "assets/images/pic4.jpg",
      "page": const InventoryScreen()
    },
    {
      "title": "Lab Work",
      "image": "assets/images/pic5.jpg",
      "page": const LabHomePage()
    },
    {
      "title": "Quick Bill",
      "image": "assets/images/pic3.jpg",
      "page": const QuickBillScreen()
    },
  ];

  List ads = [
    "https://images.unsplash.com/photo-1538108149393-fbbd81895907?w=1200",
    "https://images.unsplash.com/photo-1581056771107-24ca5f033842?w=1200",
    "https://images.unsplash.com/photo-1579684385127-1ef15d508118?w=1200",
  ];


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
          key: scaffoldKey,
          drawer: buildDrawer(),

        bottomNavigationBar: Container(
          color: Colors.white,
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom == 0 ? 20 : 5,
            top: 10,
            left: 10,
            right: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Container(
                height: 40,
                width: 40,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green,
                ),
                child: const Icon(
                  Icons.phone,
                  color: Colors.white,
                ),
              ),

              const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Trial period will expire on 21/03/2026."),
                  Text(
                    "Click here to Upgrade",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),

              GestureDetector(
                onTap: () {
                  showAddMenu(context);
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),

        body: Column(
            children: [


          Container(
            padding: const EdgeInsets.only(
                top: 45, left: 12, right: 12, bottom: 15),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF1E88E5),
                  Color(0xFF1565C0),
                ],
              ),
            ),

            child: Column(
              children: [

                Row(
                  children: [

                    GestureDetector(
                      onTap: () {
                        scaffoldKey.currentState!.openDrawer();
                      },
                      child: const Icon(Icons.menu, color: Colors.white),
                    ),

                    SizedBox(width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.02),

                    Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.70,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),

                      child: TextField(
                        focusNode: searchFocus,
                        autofocus: false,
                        textInputAction: TextInputAction.search,
                        decoration: const InputDecoration(
                          hintText: "Search Patient",
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.search),
                        ),
                      )
                    ),

                    SizedBox(width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.02),

                    const Icon(Icons.notifications, color: Colors.white),
                  ],
                ),

                const SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Row(
                      children: [
                        Text(
                          dateRange,
                          style: const TextStyle(color: Colors.white),
                        ),
                        const Icon(Icons.arrow_drop_down,
                            color: Colors.white)
                      ],
                    ),

                    const Row(
                      children: [
                        CircleAvatar(
                          radius: 12,
                          backgroundColor: Colors.white,
                          child: Icon(Icons.person, size: 16),
                        ),
                        SizedBox(width: 6),
                        Text(
                          "Karishma",
                          style: TextStyle(color: Colors.white),
                        ),
                        Icon(Icons.arrow_drop_down,
                            color: Colors.white)
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 15),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              height: 110,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [

                  statCard("0 (0)", "New Patients", Colors.blue, const CliniciaScreen()),
                  const SizedBox(width: 10),

                  statCard("1", "Patient Visits", Colors.red, const PatientVisitReportScreen()),
                  const SizedBox(width: 10),

                  statCard("0", "Appointments", Colors.orange, const AppointmentScreen()),
                  const SizedBox(width: 10),

                  statCard("0", "Missed Appointments", Colors.purple, const MissedAppointmentScreen()),
                  const SizedBox(width: 10),

                  statCard("900", "Professional Fees", Colors.green, const AccountsPage()),
                  const SizedBox(width: 10),

                  statCard("0", "Payment Collection", Colors.teal, const AccountsPage()),
                  const SizedBox(width: 10),

                  statCard("300", "Outstanding", Colors.deepOrange, const AccountsPage()),
                  const SizedBox(width: 10),

                  statCard("0", "Expenses", Colors.brown, const AccountsPage()),
                ],
              ),
            ),
          ),

          const SizedBox(height: 10),

          CarouselSlider(
            options: CarouselOptions(
              height: 150,
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: 0.9,
            ),
            items: ads.map((url) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  url,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              );
            }).toList(),
          ),

          const SizedBox(height: 10),

          Container(
            color: Colors.white,
            child: TabBar(
              controller: tabController,
              labelColor: Colors.teal,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.teal,
              tabs: const [
                Tab(text: "Menu"),
                Tab(text: "Schedule"),
              ],
            ),
          ),

          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [

                GridView.builder(
                  padding: const EdgeInsets.all(16),
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                  ),
                  itemCount: menuItems.length,
                  itemBuilder: (context, index) {
                    var item = menuItems[index];

                    return GestureDetector(
                      onTap: () {
                        if (item["page"] != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => item["page"],
                            ),
                          );
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFFE3F2FD),
                              Color(0xFFE3F2FD),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(18),
                        ),

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Container(
                              height: 55,
                              width: 55,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(14),
                              ),

                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Image.asset(
                                  item["image"],
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),

                            const SizedBox(height: 10),

                            Text(
                              item["title"],
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                                color: Colors.black87,
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),

                const ScheduleScreen()
              ],
            ),
          ),
        ],
                ),
      ),
    );
  }

  Drawer buildDrawer() {
    return Drawer(
      child: Column(
        children: [

          /// PROFILE HEADER
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 50, bottom: 20),
            color: const Color(0xFF1565C0),
            child: const Column(
              children: [

                CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    size: 40,
                    color: Color(0xFF1565C0),
                  ),
                ),

                SizedBox(height: 10),

                Text(
                  "Dr. Karishma",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 5),

                Text(
                  "Subscription Start : 01 Jan 2026",
                  style: TextStyle(color: Colors.white70, fontSize: 12),
                ),

                Text(
                  "Subscription End : 01 Jan 2027",
                  style: TextStyle(color: Colors.white70, fontSize: 12),
                ),

              ],
            ),
          ),

          const SizedBox(height: 10),

          /// ACCOUNT SECTION
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Account",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),

          const SizedBox(height: 10),

          ListTile(
            leading: const Icon(Icons.share),
            title: const Text("Share"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CampaignPage(),
                ),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.info),
            title: const Text("About us"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CampaignPage(),
                ),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.privacy_tip),
            title: const Text("Privacy Policy"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PrivacyPage(),
                ),
              );
            },
          ),
          /// CHANGE PASSWORD
          ListTile(
            leading: const Icon(Icons.lock),
            title: const Text("Change Password"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsScreen(),
                ),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.feedback),
            title: const Text("Send Feedback"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CampaignPage(),
                ),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.info),
            title: const Text("Whats New"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CampaignPage(),
                ),
              );
            },
          ),

          /// REFER & EARN
          ListTile(
            leading: const Icon(Icons.card_giftcard),
            title: const Text("Refer & Earn"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CampaignPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.attach_money),
            title: const Text("My Rewards"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CampaignPage(),
                ),
              );
            },
          ),

          /// SETTINGS
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("Settings"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsScreen(),
                ),
              );
            },
          ),

          const Divider(),

          /// LOGOUT
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text("Logout"),
            onTap: () {

              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(

                    title: const Text("Logout"),

                    content: const Text(
                      "Are you sure you want to logout?",
                    ),

                    actions: [

                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Cancel"),
                      ),

                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => const SplashScreenPage()));

                          Navigator.pop(context);

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Logged Out"),
                            ),
                          );

                        },
                        child: const Text("Confirm"),
                      ),

                    ],
                  );
                },
              );

            },
          ),

        ],
      ),
    );
  }

  Widget statCard(String number, String title, Color color, Widget screen) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => screen,
          ),
        );
      },
      child: Container(
        width: 120,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color.withOpacity(0.15),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              number,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),

            const SizedBox(height: 6),

            Text(
              title,
              textAlign: TextAlign.center,
              maxLines: 2,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget buildAddItem(IconData icon, String title) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.blue,
        child: Icon(icon, color: Colors.white),
      ),
      title: Text(title),
      onTap: () {
        Navigator.pop(context);
        print(title);
      },
    );
  }
}


