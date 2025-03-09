import 'package:flutter/material.dart';
import 'Home Page/home_page.dart';
import 'Home Page/ScanQRPage.dart';
import 'Home Page/AttendancePage.dart';
import 'Home Page/ProfilePage.dart';
import 'Home Page/Menupage.dart';
import 'Home Page/Course.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Class App',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (context) => const HomePage(),
        '/scanQR': (context) => ScanQRPage(),
        '/attendance': (context) => AttendancePage(),
        '/profile': (context) => const ProfilePage(),
        '/Menu': (context) => const MenuPage(),
      },
    );
  }
}

