import 'package:e_commerce/state-management/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({
    super.key,
  });

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isFaceIDEnabled = false;
  bool isPushNotificationsEnabled = true;
  bool isLocationServicesEnabled = true;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Account & Settings'),
        backgroundColor: themeProvider.isDarkTheme ? Colors.grey[850] : Colors.white,
        elevation: 0,
        foregroundColor: themeProvider.isDarkTheme ? Colors.white : Colors.black,
        actions: [
          IconButton(
            onPressed: () {
              themeProvider.toggleTheme(!themeProvider.isDarkTheme);
            },
            icon: Icon(themeProvider.isDarkTheme ? Icons.dark_mode : Icons.light_mode),
            color: themeProvider.isDarkTheme ? Colors.white : Colors.amber,
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const SectionTitle(title: 'Account'),
          SettingsTile(
            icon: Icons.notifications,
            title: 'Notification Setting',
            onTap: () {},
          ),
          SettingsTile(
            icon: Icons.location_on,
            title: 'Shipping Address',
            onTap: () {},
          ),
          SettingsTile(
            icon: Icons.payment,
            title: 'Payment Info',
            onTap: () {},
          ),
          SettingsTile(
            icon: Icons.delete,
            title: 'Delete Account',
            onTap: () {},
          ),
          const SectionTitle(title: 'App Settings'),
          SwitchTile(
            title: 'Enable Face ID For Log In',
            value: isFaceIDEnabled,
            onChanged: (bool value) {
              setState(() {
                isFaceIDEnabled = value;
              });
            },
          ),
          SwitchTile(
            title: 'Enable Push Notifications',
            value: isPushNotificationsEnabled,
            onChanged: (bool value) {
              setState(() {
                isPushNotificationsEnabled = value;
              });
            },
          ),
          SwitchTile(
            title: 'Enable Location Services',
            value: isLocationServicesEnabled,
            onChanged: (bool value) {
              setState(() {
                isLocationServicesEnabled = value;
              });
            },
          ),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  const SectionTitle({required this.title, super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.grey[700],
        ),
      ),
    );
  }
}

class SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const SettingsTile({
    required this.icon,
    required this.title,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey[700]),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: onTap,
    );
  }
}

class SwitchTile extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  const SwitchTile({
    required this.title,
    required this.value,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text(title),
      value: value,
      onChanged: onChanged,
    );
  }
}
