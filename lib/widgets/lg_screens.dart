import 'package:flutter/material.dart';


class LGScreens extends StatelessWidget {
  const LGScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0,16, 0, 0),
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
                        color: Color(0xFFEA4335),
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
                      color: Color(0xFFFBBC04),
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
                        color: Color(0xFF0D652D),
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
                  child: const StatusDot(),
                ),
                Positioned(
                  top: 22, // Adjust position for LG1
                  left: 160, 
                  child: const StatusDot(),
                ),
                Positioned(
                  top: 10, // Adjust position for LG3
                  right: 25, // Slight right offset for LG3
                  child: const StatusDot(),
                ),
                
              ],
            ),
    );
  }
}

class StatusDot extends StatelessWidget {
  const StatusDot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        color: Color(0xFF00FF00),
        shape: BoxShape.circle,
        // border: Border.all(color: Colors.white, width: 2),
      ),
    );
  }
}

class IndicatorDot extends StatelessWidget {
  final bool isActive;
  const IndicatorDot({required this.isActive, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isActive ? 12 : 8,
      height: isActive ? 12 : 8,
      decoration: BoxDecoration(
        color: isActive ?Color(0xFF00FF00) : Colors.red,
        shape: BoxShape.circle,
      ),
    );
  }
}