import 'package:flutter/cupertino.dart';

class SettingItem {
  final String title;
  final String? subtitle;
  final IconData? icon;
  final VoidCallback? onTap;
  bool isToggle; // for switches

  SettingItem({
    required this.title,
    this.subtitle,
    this.icon,
    this.onTap,
    this.isToggle = false,
  });
}