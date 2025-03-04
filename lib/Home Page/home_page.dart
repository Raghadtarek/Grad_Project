import 'package:flutter/material.dart';
import 'ScanQRPage.dart'; // Ensure these pages exist and are imported correctly
import 'AttendancePage.dart';
import 'ProfilePage.dart';
import 'Menupage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Image.asset(
            'assets/imgs/image 1.png',
            width: 28,
            height: 31,
          ),
          onPressed: () {},
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
            onPressed: () {


            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Hi, Raghad",
                style: TextStyle(
                  height: 1.3,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                  color: Color(0xFF145DA0),
                ),
              ),
              const Text(
                "Welcome to your Class",
                style: TextStyle(
                  height: 0.6,
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  color: Color(0xFF145DA0),
                ),
              ),
              const SizedBox(height: 9),
              _userInfoCard(),
              const SizedBox(height: 20),
              _todaysClasses(context),
              const SizedBox(height: 20),
              _navButton("Scan QR", context, ScanQRPage()),
              _navButton("My Attendance", context, AttendancePage()),
              _navButton("My Profile", context, ProfilePage()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _userInfoCard() {
    return Container(
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: const Color(0xff0cbcccd),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Row(
        children: const[
          const CircleAvatar(
            radius: 24,
            backgroundColor: Colors.grey,
            child: Icon(Icons.person, color: Colors.black),
          ),
          const SizedBox(width: 11),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Raghad Tarek",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF145DA0),
                ),
              ),
              Text(
                "200020345@must.edu.eg",
                style: TextStyle(color: Color(0xFF145DA0)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _todaysClasses(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: const Color(0xFF145DA0),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Today's Classes",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 14),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 18),
            decoration: BoxDecoration(
              color: const Color(0xffd3d4d5),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _classItem("Computer Architecture", "LEC 27A TH SS", "9:00 - 11:00"),
                _classItem("Software Engineering", "LEC 27B TH SS", "11:00 - 1:00"),
                _classItem("Software Engineering", "SEC 11B LB SS", "1:00 - 3:00"),
                _classItem("Computer Graphics", "SEC 11A LB SS", "3:00 - 5:00"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _classItem(String title, String location, String time) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 9,
                      height: 9,
                      margin: const EdgeInsets.only(right: 8),
                      decoration: const BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Color(0xFF145DA0),
                      ),
                    ),
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF145DA0),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(
                    location,
                    style: const TextStyle(
                      fontSize: 8,
                      color: Color(0xFF145DA0),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Text(
            time,
            style: const TextStyle(fontSize: 8, color: Color(0xFF145DA0)),
          ),
        ],
      ),
    );
  }

  Widget _navButton(String text, BuildContext context, Widget destination) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => destination));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 18),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        decoration: BoxDecoration(
          color: Color(0xffd3d4d5),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Color(0xFF145DA0))),
            const Icon(Icons.arrow_forward_ios, size: 17, color: Color(0xFF145DA0)),
          ],
        ),
      ),
    );
  }
}
