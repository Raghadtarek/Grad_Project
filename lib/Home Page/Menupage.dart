import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menu"),
        centerTitle: true,
        backgroundColor: const Color(0xFF145DA0),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _menuItem(context, "Home", Icons.home, () {
              Navigator.pop(context); // Replace with actual navigation
            }),
            _menuItem(context, "Scan QR", Icons.qr_code, () {
              Navigator.pushNamed(context, '/scanQR');
            }),
            _menuItem(context, "My Attendance", Icons.event_available, () {
              Navigator.pushNamed(context, '/attendance');
            }),
            _menuItem(context, "My Profile", Icons.person, () {
              Navigator.pushNamed(context, '/profile');
            }),
          ],
        ),
      ),
    );
  }

  Widget _menuItem(BuildContext context, String title, IconData icon, VoidCallback onTap) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: Icon(icon, color: const Color(0xFF145DA0)),
        title: Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        onTap: onTap,
      ),
    );
  }
}