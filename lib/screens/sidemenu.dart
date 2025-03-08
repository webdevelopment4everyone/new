import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10,),
            const Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(
                      'assets/woman.png'), 
                ),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Take Care!', style: TextStyle(color: Colors.grey)),
                    Text(
                      'Richa Bose',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            _buildSectionTitle('Settings'),
            _buildSettingsOption(Icons.notifications, 'Notification',
                'Check your medicine notification'),
            _buildSettingsOption(
                Icons.volume_up, 'Sound', 'Ring, Silent, Vibrate'),
            _buildSettingsOption(Icons.person, 'Manage Your Account',
                'Password, Email ID, Phone Number'),
            const SizedBox(height: 20),
            _buildSectionTitle('Device'),
            _buildDeviceCard(),
            const SizedBox(height: 20),
            _buildSectionTitle('Caretakers: 03'),
            _buildCaretakersSection(),
            const SizedBox(height: 20),
            _buildDoctorSection(),
            const SizedBox(height: 20),
            _buildSettingsOption(null, 'Privacy Policy', ''),
            _buildSettingsOption(null, 'Terms of Use', ''),
            _buildSettingsOption(null, 'Rate Us', ''),
            _buildSettingsOption(null, 'Share', ''),
            const SizedBox(height: 20),
            Center(
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(300, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 100),
                ),
                child: const Text('Log Out', style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildSettingsOption(IconData? icon, String title, String subtitle) {
    return ListTile(
      leading: icon != null ? Icon(icon, color: Colors.grey) : null,
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
      subtitle: subtitle.isNotEmpty
          ? Text(subtitle, style: const TextStyle(color: Colors.grey))
          : null,
      contentPadding: EdgeInsets.zero,
    );
  }

  Widget _buildDeviceCard() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          _buildSettingsOption(Icons.bluetooth, 'Connect', 'Bluetooth, Wi-Fi'),
          const SizedBox(height: 10),
          _buildSettingsOption(
              Icons.volume_up, 'Sound Option', 'Ring, Silent, Vibrate'),
        ],
      ),
    );
  }

  Widget _buildCaretakersSection() {
    List<Map<String, String>> caretakers = [
      {'name': 'Dipa Luna', 'image': 'assets/woman.png'},
      {'name': 'Roz Sod..', 'image': 'assets/user.png'},
      {'name': 'Sunny Tu..', 'image': 'assets/user.png'},
      {'name': 'Add', 'image': 'assets/new.png'},
    ];

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          ...caretakers.map((caretaker) => Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage(caretaker['image']!),
                    ),
                    const SizedBox(height: 4),
                    Text(caretaker['name']!,
                        style: const TextStyle(fontSize: 12)),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildDoctorSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Column(
        children: [
          Icon(Icons.add_circle, size: 40, color: Colors.blue),
          SizedBox(height: 4),
          Text('Add Your Doctor',
              style: TextStyle(fontWeight: FontWeight.bold)),
          Text('Or use ', style: TextStyle(color: Colors.grey)),
          Text('invite link', style: TextStyle(color: Colors.orange)),
        ],
      ),
    );
  }
}
