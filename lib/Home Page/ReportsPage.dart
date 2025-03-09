import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ReportPage extends StatelessWidget {
  final String subjectName;  // Accepts subject name

  ReportPage({required this.subjectName});

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
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 18),
              height: 65,
              decoration: BoxDecoration(
                color: Color(0xFFd3d4d5),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    subjectName,  // ✅ Uses subject name
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

            SizedBox(height: 20),

            // Bigger Donut Chart with Percentage Inside
            Center(
              child: SizedBox(
                height: 250,  // ⬆️ Increased height for bigger chart
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    PieChart(
                      PieChartData(
                        sections: [
                          PieChartSectionData(
                            value: 66.7,
                            color: Colors.green,
                            radius: 41,  // ⬆️ Increased radius for thicker sections
                            title: '',
                          ),
                          PieChartSectionData(
                            value: 25.0,
                            color: Colors.red,
                            radius: 41,  // ⬆️ Increased radius for thicker sections
                            title: '',
                          ),
                          PieChartSectionData(
                            value: 8.3,
                            color: Colors.black,
                            radius: 41,  // ⬆️ Increased radius for thicker sections
                            title: '',
                          ),
                        ],
                        centerSpaceRadius: 78,  // ⬆️ Increased to make the white area inside the circle bigger
                        sectionsSpace: 0,
                        centerSpaceColor: Colors.white,
                        borderData: FlBorderData(show: false),
                      ),
                    ),
                    // Percentage Text in Center
                    Text(
                      "66.7%",
                      style: TextStyle(
                        fontSize: 28,  // ⬆️ Increased font size
                        fontWeight: FontWeight.bold,
                        fontFamily: "Rubik",
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 30),

            // Legend
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildLegendItem("Present", Colors.green),
                _buildLegendItem("Absent", Colors.red),
                _buildLegendItem("Cancel", Colors.black),
              ],
            ),

            SizedBox(height: 80),

            // Statistics Box
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: Color(0xFFD3D4D5),
                borderRadius: BorderRadius.circular(1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildStatsRow("Total Classes", "6"),
                  _buildStatsRow("Present Days", "4"),
                  _buildStatsRow("Absent Days", "2"),
                  _buildStatsRow("Canceled Lectures", "1"),
                ],
              ),
            ),

            SizedBox(height: 50),

            // Encouragement Text
            Center(
              child: Text(
                "Keep Up the Good Work!",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Rubik",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget to build legend items
  Widget _buildLegendItem(String label, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Container(
            width: 30,
            height: 10,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          SizedBox(width: 5),
          Text(
            label,
            style: TextStyle(fontSize: 12, fontFamily: "Rubik",fontWeight:FontWeight.bold ),
          ),
        ],
      ),
    );
  }

  // Widget to build statistics rows
  Widget _buildStatsRow(String title, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: "Rubik",
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: "Rubik",
            ),
          ),
        ],
      ),
    );
  }
}
