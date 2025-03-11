import 'package:flutter/material.dart';

class AttendancePage extends StatefulWidget {
  @override
  _AttendancePageState createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  String selectedTerm = 'Fall/2024-2025'; // Default selected value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Image.asset(
            'assets/imgs/back (1) 1.png',
            width: 30,
            height: 31,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: SizedBox(
          height: 51,
          width: 223,
          child: Image.asset('assets/imgs/logo.png'),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Image.asset(
              'assets/imgs/image 2.png',
              width: 28,
              height: 29,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Dropdown Menu
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8), // Increased radius for better design
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectedTerm,
                  onChanged: (value) {
                    setState(() {
                      selectedTerm = value!;
                    });
                  },
                  items: [
                    DropdownMenuItem(value: 'Fall/2024-2025', child: Text('Fall/2024-2025')),
                    DropdownMenuItem(value: 'Spring/2024', child: Text('Spring/2024')),
                    DropdownMenuItem(value: 'Fall/2023-2024', child: Text('Fall/2023-2024')),
                    DropdownMenuItem(value: 'Spring/2023', child: Text('Spring/2023')),
                  ],
                  icon: Icon(Icons.arrow_drop_down),
                ),
              ),
            ),
            SizedBox(height: 16),

            // Subject Header
            Container(
              color: Color(0xFF145DA0),
              padding: EdgeInsets.all(10),
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Subject", style: TextStyle(color: Color(0xFFD9D9D9), fontWeight: FontWeight.bold, fontSize: 16)),
                  Text("Action", style: TextStyle(color: Color(0xFFD9D9D9), fontWeight: FontWeight.bold, fontSize: 16)),
                ],
              ),
            ),
            SizedBox(height: 0),

            // Subject List
            Expanded(
              child: ListView(
                children: [
                  _buildRow("CS44I"),
                  _buildRow("CS481"),
                  _buildRow("CS402"),
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

  // Function to Build Subject Row
  Widget _buildRow(String subject) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        border: Border(bottom: BorderSide(color: Colors.white)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(subject, style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),

          // Square Container for Details Button
          Container(
            width: 95,  // Fixed width
            height: 40, // Fixed height (making it a square)
            decoration: BoxDecoration(
              color: Color(0xFF145DA0),
              borderRadius: BorderRadius.circular(10), // Rounded corners
            ),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent, // Keep background from Container
                shadowColor: Colors.transparent, // Remove shadow
                padding: EdgeInsets.zero, // Remove default button padding
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Details", style: TextStyle(color: Color(0xFFD9D9D9))),
                  SizedBox(width: 9),
                  Icon(Icons.arrow_forward_ios, color: Color(0xFFD9D9D9), size: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
