import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'About',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xFF4285F4), // Google Blue
      ),
      body: Container(
        color: Color(0xFFF1F3F4), // Light background color, closer to Google's light gray
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            // Section Title with a Stylish Header
            Text(
              'Demo App for Task 2 Submission',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4285F4), // Google Blue
              ),
            ),
            SizedBox(height: 10),
            
            // Image or Icon for the Project (Optional)
            Center(
              child: Icon(
                Icons.account_tree_rounded, // Icon representing the project
                size: 100,
                color: Color(0xFF4285F4), // Google Blue
              ),
            ),
            SizedBox(height: 30),

            // Description in a Card
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Subtitle or additional text
                    Text(
                      'What is this App?',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0F9D58), // Google Green
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'This is a demo app for Task 2 submission for the LG GSOC project. '
                      'Through this app, users can connect to the LG rig and send their custom KML or use a prebuilt KML.',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),

            // Features or Key Points Section
            Text(
              'Key Features:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4285F4), // Google Blue
              ),
            ),
            SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.check, color: Color(0xFF0F9D58)), // Google Green
              title: Text('Connect to LG rig'),
            ),
            ListTile(
              leading: Icon(Icons.check, color: Color(0xFF0F9D58)), // Google Green
              title: Text('Send custom or prebuilt KML files'),
            ),
            ListTile(
              leading: Icon(Icons.check, color: Color(0xFF0F9D58)), // Google Green
              title: Text('Simple, easy-to-use interface'),
            ),
            
          ],
        ),
      ),
    );
  }
}
