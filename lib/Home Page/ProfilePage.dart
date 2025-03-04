import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

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
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Transform.scale(
                    scaleX: 0.9,
                    scaleY:0.9,
                    child: (Image.asset('assets/imgs/back (1) 1.png')),
                  ),
                ),
                SizedBox(width: 9.1),
                Text(
                  "My Profile",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF145DA0),
                  ),
                ),
              ],
            ),
            SizedBox(height: 25),
            _profileHeader(),
            SizedBox(height: 35),
            _infoCard(),
            SizedBox(height: 25),
            _statisticsCard(),
            SizedBox(height: 25),
            _contactsCard(),
          ],
        ),
      ),
    );
  }

  Widget _profileHeader() {
    return Row(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.grey,
          child: Icon(Icons.person, size: 50, color: Colors.white),
        ),
        SizedBox(width: 16,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Raghad Tarek Elsayed",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              "Mohamed",
              style: TextStyle(height:0.7,fontSize: 20, fontWeight: FontWeight.bold,fontFamily: 'inter',),
            ),
            Text("ID: 200020345",style: TextStyle(height:1.8,fontSize: 15, fontWeight: FontWeight.bold,fontFamily: 'inter',),),
            Text("Major: Computer Science",style: TextStyle(height:0.6,fontSize: 15, fontWeight: FontWeight.bold,fontFamily: 'inter',),),
          ],
        ),
      ],
    );
  }

  Widget _infoCard() {
    return Container(
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Color(0xffd3d4d5),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("CGPA: 3.00", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xFF145DA0))),
          Text("Rank: 68", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xFF145DA0))),
          Text("Class: 7", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xFF145DA0))),
        ],
      ),
    );
  }

  Widget _statisticsCard() {
    return Container(
      padding: EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Color(0xffd3d4d5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Statistics", style: TextStyle(color:Color(0xFF145DA0),fontWeight: FontWeight.bold, fontSize: 18)),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _circularProgress("108/140\nHours", "Credit Earned", 0.75),
              _circularProgress("90%", "Total Attendant\n Classes", 0.90),
            ],
          ),
        ],
      ),
    );
  }
  Widget _circularProgress(String value, String label, double percentage) {
    return Column(
      children: [
        Transform.translate(
          offset: Offset(10, 0), // Moves the entire widget 10 pixels to the right
          child: SizedBox(
            width: 90,
            height: 90,
            child: Stack(
              fit: StackFit.expand,
              children: [
                // White background circle
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white, // White background
                  ),
                ),
                CircularProgressIndicator(
                  value: percentage,
                  backgroundColor: Colors.white,
                  color: Color(0xFF145DA0),
                  strokeWidth: 5,
                ),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white, // Ensures the text background is white
                    ),
                    padding: EdgeInsets.all(8), // Add padding for spacing
                    child: Text(
                      value,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF145DA0),
                        fontFamily: 'inter',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 10),
        Transform.translate(
          offset: Offset(10, 0), // Moves the text to the right as well
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF145DA0),
              fontWeight: FontWeight.bold,
              fontFamily: 'inter',
            ),
          ),
        ),
      ],
    );
  }



  Widget _contactsCard() {
    return Container(
      padding: EdgeInsets.all(27),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Contacts", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color:Color(0xFF145DA0),fontFamily: 'inter',)),
          SizedBox(height: 15),
          _contactRow(Icons.phone, "01012345678"),
          SizedBox(height: 15), // Space between rows
          _contactRow(Icons.email, "raghadtarek69@gmail.com"),
          SizedBox(height: 15), // Space between rows
          _contactRow(Icons.person, "Advisor: Mohamed Mohamed"),
        ],
      ),
    );

  }

  Widget _contactRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: Colors.black,size:28,),
        SizedBox(width: 10),
        Text(text, style: const TextStyle(height:0,fontSize: 16,color:Color(0xFF145DA0),fontWeight: FontWeight.bold,fontFamily: 'inter',)),
      ],
    );
  }
}