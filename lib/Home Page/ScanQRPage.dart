import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'QRscannerPage.dart';


class ScanQRPage extends StatefulWidget {
  @override
  _ScanQRPageState createState() => _ScanQRPageState();
}

class _ScanQRPageState extends State<ScanQRPage> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: 'oVnvOSlWFCw', // Your YouTube video ID
      flags: YoutubePlayerFlags(
        autoPlay: true, // Video plays automatically
        mute: false,
      ),
    );
  }

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
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              SizedBox(height: 60), // Moves everything slightly lower
              Text(
                'How to scan the QR code',
                style: TextStyle(fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF145DA0),
                    fontFamily: 'Inter'),
              ),
              SizedBox(height: 75),
              Container(
                width: double.infinity,
                height: 320, // Bigger video
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: YoutubePlayer(
                  controller: _controller,
                  showVideoProgressIndicator: true,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 50), // Keeps scan button lower
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF145DA0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
              ),
              onPressed: () {
                // Navigate to QR Code Scanner Page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QRscannerPage()),
                );
              },
              child: Text(
                'Scan',
                style: TextStyle(fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

}
