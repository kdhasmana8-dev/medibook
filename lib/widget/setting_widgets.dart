import 'package:flutter/material.dart';
import '../models/setting_models.dart';

class SettingsTile extends StatelessWidget {
  final SettingItem setting;

  const SettingsTile({super.key, required this.setting});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(setting.title),
      subtitle: setting.subtitle != null ? Text(setting.subtitle!) : null,
      trailing: setting.isToggle
          ? Switch(
        value: true,
        onChanged: (_) => setting.onTap?.call(),
      )
          : const Icon(Icons.arrow_forward_ios, size: 16),
      leading: setting.icon != null ? Icon(setting.icon) : null,
      onTap: setting.onTap,
    );
  }
}