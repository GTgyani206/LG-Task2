import 'package:flutter/material.dart';
import 'package:lg_task2/screens/home/home_screen.dart';
import 'package:lg_task2/screens/kml/kml_screen.dart';
import 'package:lg_task2/screens/settings/settings_screen.dart';

class FloatingBottomNavBar extends StatelessWidget {
  const FloatingBottomNavBar({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          margin: EdgeInsets.fromLTRB(90,25,90,25),
          decoration: BoxDecoration(
            color: Color(0xFF202124),
            borderRadius: BorderRadius.all(Radius.circular(25)),
            boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 186, 186, 186),
              offset: const Offset(3.0,5.0),
              blurRadius: 8.0,
              spreadRadius: 5.0,
              
              )
            ]
          ),
          child: BottomAppBar(
            color: Colors.black,
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                  color: Colors.white,
                  icon: Icon(Icons.home_filled),
                  onPressed: () {
                    Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
                  },
                ),
                IconButton(
                  color: Colors.white,
                  icon: Icon(Icons.location_on),
                  onPressed: () {
                    Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => KmlScreen()),
              );
                  },
                ),
                IconButton(
                  color: Colors.white,
                  icon: Icon(Icons.settings),
                  onPressed: () {
                    Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsScreen()),
              );
                  },
                ),
              ],
            ),
          ),
        ),
      );
  }
}