import 'package:flutter/material.dart';
import 'package:medibook/views/homepage_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen>
    with SingleTickerProviderStateMixin {

  late TabController tabController;

  final password = TextEditingController();

  bool hidePassword = true;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  void showResetPasswordDialog() {

    TextEditingController resetController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {

        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),

          child: Padding(
            padding: const EdgeInsets.all(20),

            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                /// ICON
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFE3F2FD),
                  ),
                  child: const Icon(
                    Icons.lock_reset,
                    color: Color(0xFF1565C0),
                    size: 30,
                  ),
                ),

                const SizedBox(height: 15),

                /// TITLE
                const Text(
                  "Reset Password",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                /// DESCRIPTION
                const Text(
                  "Enter your registered Email or Mobile Number",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(height: 20),

                /// INPUT
                TextField(
                  controller: resetController,

                  decoration: InputDecoration(
                    hintText: "Email or Mobile Number",

                    prefixIcon: const Icon(Icons.person_outline),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                /// BUTTONS
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Cancel"),
                    ),

                    ElevatedButton(
                      onPressed: () {

                        Navigator.pop(context);

                      },

                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1565C0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25,
                            vertical: 12),
                      ),

                      child: const Text(
                        "Submit",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Column(
        children: [

          /// TOP HEADER
          Container(
            height: 110,
            padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF1E88E5),
                  Color(0xFF1565C0),
                ],
              ),
            ),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Row(
                  children: [

                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Icon(
                        Icons.medical_services,
                        color: Colors.blue,
                      ),
                    ),

                    const SizedBox(width: 12),

                    const Text(
                      "Sign In",
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                const CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: Icon(
                    Icons.help_outline,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),

          /// TAB BAR
          Container(
            color: Colors.white,
            child: TabBar(
              controller: tabController,
              indicatorColor: const Color(0xFF1565C0),
              labelColor: const Color(0xFF1565C0),
              unselectedLabelColor: Colors.grey,

              tabs: const [

                Tab(text: "Doctor Login"),

                Tab(text: "Enterprise Login"),

              ],
            ),
          ),

          /// TAB CONTENT
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [

                /// DOCTOR LOGIN
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      const SizedBox(height: 40),

                      /// EMAIL / MOBILE
                      TextField(
                        decoration: const InputDecoration(
                          labelText: "Email or Mobile Number",
                        ),
                      ),

                      const SizedBox(height: 20),

                      /// PASSWORD
                      TextField(
                        controller: password,
                        obscureText: hidePassword,
                        decoration: InputDecoration(
                          labelText: "Password",
                          suffixIcon: IconButton(
                            icon: Icon(
                              hidePassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                hidePassword = !hidePassword;
                              });
                            },
                          ),
                        ),
                      ),

                      /// RESET PASSWORD
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            showResetPasswordDialog();
                          },
                          child: const Text(
                            "Reset Password?",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      /// CREATE ACCOUNT + SIGN IN
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          TextButton(
                            onPressed: () {
                              // Navigate to Registration Screen
                            },
                            child: const Text(
                              "Create Account",
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),

                          OutlinedButton(
                            onPressed: () {
                              Navigator.push(context,
                                MaterialPageRoute(
                                  builder: (context) => const DoctorDashboard(),
                                ),
                              );
                            },
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(
                                color: Colors.black,
                              ),
                            ),
                            child: const Text("Sign In"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                /// ENTERPRISE LOGIN
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(

                    children: [

                      const SizedBox(height: 40),

                      TextField(
                        decoration: const InputDecoration(
                          hintText: "Enter organization code",
                        ),
                      ),

                      const SizedBox(height: 30),

                      Align(
                        alignment: Alignment.centerRight,
                        child: OutlinedButton(
                          onPressed: () {},

                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                              color: Colors.black,
                            ),
                          ),

                          child: const Text("Submit"),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}




