import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:medibook/viewmodels/accounts_viewmodel.dart';
import 'package:medibook/viewmodels/bill_viewmodel.dart';
import 'package:medibook/viewmodels/campaign_viewmodel.dart';
import 'package:medibook/viewmodels/inventory_viewmodel.dart';
import 'package:medibook/viewmodels/lab_viewmodel.dart';
import 'package:medibook/viewmodels/prescription_viewmodel.dart';
import 'package:medibook/viewmodels/report_viewmodel.dart';
import 'package:medibook/viewmodels/setting_viewmodel.dart';
import 'package:provider/provider.dart';

import 'package:medibook/views/animation_screen.dart';
import 'package:medibook/viewmodels/quick_bill_viewmodel.dart';
import 'package:medibook/viewmodels/appointment_viewmodel.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(const MedibookPage());
}

class MedibookPage extends StatelessWidget {
  const MedibookPage({super.key});

  @override
  Widget build(BuildContext context) {

    return MultiProvider(

      providers: [

        ChangeNotifierProvider(
          create: (_) => QuickBillViewModel(),
        ),

        ChangeNotifierProvider(
          create: (_) => AppointmentViewModel(),
        ),

        ChangeNotifierProvider(
          create: (_) => ReportViewModel(),
        ),

        ChangeNotifierProvider(
          create: (_) => CampaignViewModel(),
        ),

        ChangeNotifierProvider(
          create: (_) => BillViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => SettingsViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => PrescriptionViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => InventoryViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => AccountsViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => LabViewModel(),
        ),
      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Doctor App",

        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),

        home: const SplashScreenPage(),
      ),
    );
  }
}