import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  final bool isDarkMode;
  final Function(bool) onToggleDarkMode;

  const SettingsScreen({
    super.key,
    required this.isDarkMode,
    required this.onToggleDarkMode, required Null Function(dynamic bool) onThemeChanged,
  });

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool notifications = true;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          'Settings',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        SwitchListTile(
          title: const Text('Enable Notifications'),
          value: notifications,
          onChanged: (value) {
            setState(() {
              notifications = value;
            });
          },
          activeColor: Colors.deepPurple,
        ),
        SwitchListTile(
          title: const Text('Dark Mode'),
          value: widget.isDarkMode,
          onChanged: widget.onToggleDarkMode,
          activeColor: Colors.deepPurple,
        ),
        ListTile(
          leading: const Icon(Icons.lock),
          title: const Text('Privacy Settings'),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.logout),
          title: const Text('Logout'),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {},
        ),
      ],
    );
  }
}
