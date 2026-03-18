import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Privacy Policy"),
      ),

      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Text(
          "Your privacy policy content goes here...",
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}


/*****
 * Terms Page
 */

class TermsPage extends StatelessWidget {
  const TermsPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Terms of Service"),
      ),

      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Text(
          "Here you can write your app terms and conditions...",
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}