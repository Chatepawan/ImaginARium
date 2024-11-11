import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(
          'Settings',
          style: TextStyle(fontFamily: 'FontBricolage'),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Account Section
            _buildSectionHeader('Account'),
            _buildOptionTile(
              context,
              Icons.account_circle,
              'Account Settings',
                  () {
                // Navigate to Account Settings
              },
            ),
            _buildOptionTile(
              context,
              Icons.security,
              'Change Password',
                  () {
                // Navigate to Change Password
              },
            ),
            const Divider(),

            // Notifications Section
            _buildSectionHeader('Notifications'),
            _buildOptionTile(
              context,
              Icons.notifications,
              'Notification Preferences',
                  () {
                // Navigate to Notification Settings
              },
            ),
            _buildOptionTile(
              context,
              Icons.volume_off,
              'Mute Notifications',
                  () {
                // Mute notifications logic
              },
            ),
            const Divider(),

            // General Section
            _buildSectionHeader('General Settings'),
            _buildOptionTile(
              context,
              Icons.language,
              'Language',
                  () {
                // Navigate to Language Settings
              },
            ),
            _buildOptionTile(
              context,
              Icons.dark_mode,
              'Theme Mode',
                  () {
                // Toggle dark/light mode
              },
            ),
            const Divider(),

            // Log Out
            _buildOptionTile(
              context,
              Icons.logout,
              'Log Out',
                  () {
                // Handle log out
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Log Out'),
                    content: const Text('Are you sure you want to log out?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Cancel'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Perform log out action
                          Navigator.pop(context);
                        },
                        child: const Text('Log Out'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build section headers
  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.blueAccent,
        ),
      ),
    );
  }

  // Helper method to build option tiles
  Widget _buildOptionTile(BuildContext context, IconData icon, String title, Function onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.blueAccent),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
      onTap: () => onTap(),
    );
  }
}
