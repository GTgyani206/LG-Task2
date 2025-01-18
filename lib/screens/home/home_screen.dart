import 'package:flutter/material.dart';
import 'package:lg_task2/widgets/lg_screens.dart';
import'package:lg_task2/widgets/navbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      bottomNavigationBar: FloatingBottomNavBar(),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          
          const SizedBox(height: 20),
          LGScreens(),
          const SizedBox(height: 20),
          DashUI(),
        ],
      ),

    );
  }
}


class DashUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  // Relaunch Button
                  ActionButton(
                    icon: Icons.warning_amber_rounded,
                    height: 80,
                    width: 150,
                    text: 'Relaunch',
                    color: Color(0xFFFBBC04),
                  ),
                  const SizedBox(height: 20),
                  // Clear KML Button
                  ActionButton(
                    icon: Icons.delete_outline,
                    height: 80,
                    width: 150,
                    text: 'Clear KML',
                    color: Color(0xFFFBBC04),
                  ),
                ],
              ),
              // LG Status
              LGStatusCard(),
            ],
          ),

          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Explore Random Places
              ActionButton(
                icon: Icons.language_outlined,
                text: 'Explore\nRandom Places',
                color: Color(0xFF34A853),
                height: 100,
                width: 175,
                multiline: true,
              ),
              // Show Logo
              ActionButton(
                icon: Icons.image_outlined,
                text: 'Show Logo',
                height: 100,
                width: 175,
                color: Color(0xFF4285F4),
                
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  final bool multiline;
  final double width;
  final double height;

  const ActionButton({
    super.key,
    required this.icon,
    required this.text,
    required this.color,
    required this.width,
    required this.height,
    this.multiline = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height ,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 30, color: Colors.black),
            const SizedBox(height: 8),
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LGStatusCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: 200,
      height: 170,
      decoration: BoxDecoration(
        color: Colors.lightGreen[100],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blueAccent, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'LG Status',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          LGStatusRow(
            label: 'lg1',
            status: 'connected',
            statusColor: Colors.green,
          ),
          LGStatusRow(
            label: 'lg2',
            status: 'not connected',
            statusColor: Colors.red,
          ),
          LGStatusRow(
            label: 'lg3',
            status: 'connected',
            statusColor: Colors.green,
          ),
        ],
      ),
    );
  }
}

class LGStatusRow extends StatelessWidget {
  final String label;
  final String status;
  final Color statusColor;

  const LGStatusRow({
    Key? key,
    required this.label,
    required this.status,
    required this.statusColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '- $label',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const Spacer(),
        Text(
          status,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: statusColor,
          ),
        ),
      ],
    );
  }
}