import 'package:flutter/material.dart';

class AttendancePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.calendar_today, color: Color(0xFF145DA0)),
            SizedBox(width: 5),
            Text(
              "attendify",
              style: TextStyle(
                color: Color(0xFF145DA0),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(5),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: 'Fall/2024-2025',
                  onChanged: (value) {},
                  items: [
                    DropdownMenuItem(
                      value: 'Fall/2024-2025',
                      child: Text('Fall/2024-2025'),
                    ),
                  ],
                  icon: Icon(Icons.arrow_drop_down),
                ),
              ),
            ),
            SizedBox(height: 16),
            Container(
              color: Color(0xFF145DA0),
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Subject", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  Text("Action", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildRow("CS44I"),
                  _buildRow("CS481"),
                  _buildRow("CS402"),
                  _buildRow("CS483"),
                  _buildRow("CS483"),
                  _buildRow("IS331"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(String subject) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        border: Border(bottom: BorderSide(color: Colors.white)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(subject, style: TextStyle(fontSize: 16)),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF145DA0),
            ),
            child: Row(
              children: [
                Text("Details", style: TextStyle(color: Colors.white)),
                Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}