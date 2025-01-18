import 'package:flutter/material.dart';
import 'package:lg_task2/screens/about/about.dart';
import 'package:lg_task2/screens/connection/connection_screen.dart';
import 'package:lg_task2/widgets/navbar.dart';


class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      bottomNavigationBar: FloatingBottomNavBar(),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.link),
            title: Text('Connect to LG'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ConnectionScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.contrast),
            title: Text('Theme'),
            onTap: () {
              // Navigate to notification settings
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('About'),
             onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutScreen()));
            },
          ),
        ],
      ),
    );
  }
}