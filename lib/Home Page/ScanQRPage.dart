import 'package:flutter/material.dart';

class ScanQRPage extends StatelessWidget {
  const ScanQRPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Scan QR")),
      body: const Center(
        child: Text("QR Scanner Page", style: TextStyle(fontSize: 18)),
      ),
    );
  }
}