import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'landing_screen.dart';
import 'caretaker_dash.dart';

class CaretakerStartScreen extends StatefulWidget {
  final User user;

  CaretakerStartScreen({required this.user});

  @override
  _CaretakerStartScreenState createState() => _CaretakerStartScreenState();
}

class _CaretakerStartScreenState extends State<CaretakerStartScreen> {
  TextEditingController caretakerIdController = TextEditingController();

  void _signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => LandingScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Caretaker Login'), backgroundColor: const Color.fromARGB(255, 30, 71, 104) ,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => _signOut(context),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Enter Caretaker ID:',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 120, // Adjust the width as needed
                  child: TextField(
                    controller: caretakerIdController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Text(
                  '-P',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle the confirmation action here
                String caretakerId = caretakerIdController.text;
                if (caretakerId == '2020202') {
                  // If the caretaker ID is 2020202, navigate to the next screen (CaretakerDashboard)
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => CaretakerDashboardScreen()),
                  );
                } else {
                  // Handle the case when the caretaker ID is not 2020202 (optional)
                  print('Invalid caretaker ID. Please try again.');
                }
              },
              child: Text('Confirm'),
              style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 30, 71, 104)), // Set the background color of the button to blue
                  ),
            ),
          ],
        ),
      ),
    );
  }
}