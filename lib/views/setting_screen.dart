import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/setting_models.dart';
import '../viewmodels/setting_viewmodel.dart';
import '../widget/setting_widgets.dart';


class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<SettingsViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Settings"),
        actions: [
          IconButton(
            icon: const Icon(Icons.power_settings_new),
            onPressed: () {
              // Logout or Power off
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Section
            _profileSection(vm),

            const SizedBox(height: 20),

            _section("General Settings", vm.generalSettings),
            _section("Preferences", vm.preferences),
            _section("Users", vm.users),
            _section("Masters", vm.masters),
            _section("Communication", vm.communication),
            _section("Add-ons", vm.addons),
          ],
        ),
      ),
    );
  }

  Widget _profileSection(SettingsViewModel vm) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage("assets/profile.jpg"),
          ),
          const SizedBox(height: 12),
          Text(
            vm.doctorName,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            vm.profileSubtitle,
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _section(String title, List<SettingItem> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          color: Colors.blueAccent,
          child: Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
        const SizedBox(height: 4),
        ...items.map((e) => SettingsTile(setting: e)),
        const SizedBox(height: 20),
      ],
    );
  }
}