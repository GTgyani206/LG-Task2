import 'package:flutter/material.dart';
import 'package:lg_task2/services/ssh.dart';
import 'package:lg_task2/widgets/lg_screens.dart';

class LGScreens extends StatelessWidget {
  const LGScreens({super.key});

  @override
  Widget build(BuildContext context) {
    final SSH ssh = SSH(); // Instance of SSH for status checking.

    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // LG Screens
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // LG2 - Red
              Transform(
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.005) // Perspective effect
                  ..rotateY(-0.3), // Tilt left
                alignment: Alignment.center,
                child: Container(
                  width: 120,
                  height: 200,
                  color: const Color(0xFFEA4335),
                  child: const Center(
                    child: Text(
                      "LG 2",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              // LG1 - Yellow
              Container(
                width: 120,
                height: 185,
                color: const Color(0xFFFBBC04),
                child: const Center(
                  child: Text(
                    "LG 1",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              // LG3 - Green
              Transform(
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.005) // Perspective effect
                  ..rotateY(0.3), // Tilt right
                alignment: Alignment.center,
                child: Container(
                  width: 120,
                  height: 200,
                  color: const Color(0xFF0D652D),
                  child: const Center(
                    child: Text(
                      "LG 3",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Online Status Dots
          Positioned(
            top: 10, // Adjust position for LG2
            left: 25, // Slight left offset for LG2
            child: StatusDot(
              isOnline: ssh.getLGStatus("lg2"), // Pass LG2 status
            ),
          ),
          Positioned(
            top: 22, // Adjust position for LG1
            left: 160,
            child: StatusDot(
              isOnline: ssh.getLGStatus("lg1"), // Pass LG1 status
            ),
          ),
          Positioned(
            top: 10, // Adjust position for LG3
            right: 25, // Slight right offset for LG3
            child: StatusDot(
              isOnline: ssh.getLGStatus("lg3"), // Pass LG3 status
            ),
          ),
        ],
      ),
    );
  }
}

class StatusDot extends StatelessWidget {
  final bool isOnline;

  const StatusDot({Key? key, required this.isOnline}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        color: isOnline ? const Color(0xFF00FF00) : Colors.red,
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white,
          width: 2,
        ),
      ),
    );
  }
}
