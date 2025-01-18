import 'package:flutter/material.dart';
import 'package:lg_task2/screens/home/home_screen.dart';
// import 'landing_controller.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/Logo.png'),
            Text('Demo App', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.black),
              ),
              onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            }, 
              child: Text("Start ->",
              style: TextStyle(color: Colors.white, fontSize: 25 ),)
            )
                
            
            
          ],
        ),
      ),
      
    );
  }
}