import 'package:flutter/material.dart';
import 'ReportsPage.dart';

class Course extends StatelessWidget {
  final String subjectName;

  Course({required this.subjectName});

  // Sample attendance data
  final List<Map<String, dynamic>> attendanceData = [

    {"lecture": "Lec 1", "date": "10-1-2024", "status": "present"},
    {"lecture": "Lec 2", "date": "10-8-2024", "status": "absent"},
    {"lecture": "Lec 3", "date": "10-1-2024", "status": "present"},
    {"lecture": "Lec 4", "date": "10-8-2024", "status": "present"},
    {"lecture": "Lec 5", "date": "10-1-2024", "status": "pending"},
    {"lecture": "Lec 6", "date": "10-8-2024", "status": "present"},
    {"lecture": "Lec 7", "date": "10-1-2024", "status": "absent"},
  ];


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
        padding: EdgeInsets.all(13),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Course Box
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(left: 18, top: 10, bottom: 8, right: 50),
              // 🔹 Added left padding
              height: 65,
              decoration: BoxDecoration(
                color: Color(0xFFd3d4d5),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    subjectName,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Rubik",
                    ),
                  ),
                  Text(
                    "3 HRs",
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      fontFamily: "Rubik",
                      height: 0.8,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 30),

            // Lecture List
            Expanded(
              child: ListView.builder(
                itemCount: attendanceData.length,
                itemBuilder: (context, index) {
                  final lecture = attendanceData[index];
                  Color bgColor = index % 2 == 0 ? Color(0xFF145DA0) : Color(
                      0xFFD6E5F5);
                  return _buildLectureTile(
                    lecture["lecture"],
                    lecture["date"],
                    lecture["status"],
                    bgColor,
                  );
                },
              ),
            ),

            // Attendance Record Button (Centered Content)
            SizedBox(height: 15),
            Center(
              child: Container(
                decoration: BoxDecoration(

                  color: Color(0xFFd3d4d5),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      // 🔹 Shadow color with less opacity
                      blurRadius: 8,
                      // 🔹 Soft blur effect
                      offset: Offset(0, 4), // 🔹 Moves shadow downward
                    ),
                  ],
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ReportPage(subjectName: subjectName),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    padding: EdgeInsets.symmetric(horizontal: 37, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "View Attendance Record",
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.9),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Rubik",
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.black.withOpacity(0.6),
                        ),
                      ),
                      SizedBox(width: 10),
                      Icon(Icons.arrow_forward_ios,
                          color: Colors.black.withOpacity(0.6), size: 16),
                    ],
                  ),
                ),

              ),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  // Widget for lecture row
  Widget _buildLectureTile(String lecture, String date, String status,
      Color bgColor) {
    IconData statusIcon;
    Color iconColor;

    if (status == "present") {
      statusIcon = Icons.check_circle;
      iconColor = Colors.green;
    } else if (status == "absent") {
      statusIcon = Icons.cancel;
      iconColor = Colors.red;
    } else {
      statusIcon = Icons.sync; // Pending status
      iconColor = Colors.black;
    }

    // Set text color based on background color
    Color textColor = (bgColor == Color(0xFF145DA0))
        ? Color(0xFFD6E5F5)
        : Color(0xFF145DA0);

    return Container(
      margin: EdgeInsets.symmetric(vertical: 0),
      padding: EdgeInsets.symmetric(vertical: 11, horizontal: 15),
      // 🔹 Added horizontal padding (moves text to the right)
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                lecture,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                  fontFamily: "Rubik",
                ),
              ),
              Text(
                date,
                style: TextStyle(color: textColor),
              ),
            ],
          ),
          Icon(statusIcon, color: iconColor, size: 26),
        ],
      ),
    );
  }
}
