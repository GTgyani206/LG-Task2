import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:lg_task2/widgets/navbar.dart';

class KmlScreen extends StatefulWidget {
  const KmlScreen({super.key});

  @override
  _KmlScreenState createState() => _KmlScreenState();
}

class _KmlScreenState extends State<KmlScreen> {
  String? _fileName;

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['kml'],
    );

    if (result != null) {
      setState(() {
        _fileName = result.files.single.name;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('KML Upload'),
      ),
      bottomNavigationBar: FloatingBottomNavBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Upload KML Button
            ElevatedButton.icon(
              onPressed: _pickFile,
              icon: Icon(Icons.upload, color: Colors.black, size: 80),
              label: Text('Upload KML', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF9AA0A6),
                minimumSize: Size(365, 150),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 30),

            // Shutdown and Reboot Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    // Shutdown Button
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.warning, color: Colors.white),
                      label: Text('Shutdown'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFFBBC04),
                        minimumSize: Size(170, 70),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                      SizedBox(height: 30),
                    // Reboot Button
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.delete, color: Colors.white),
                      label: Text('Reboot'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:Color(0xFFFBBC04),
                        minimumSize: Size(170, 70),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFEA4335),
                    minimumSize: Size(150, 170),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Night Light \nView of India \nduring Diwali',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16,), textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),

            // Send KML Button
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF202124),
                minimumSize: Size(200, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text('Send KML', style: TextStyle(color: Colors.white)),
            ),
            SizedBox(height: 20),

            // Display selected file name
            Text(
              _fileName != null
                  ? 'Selected File: $_fileName'
                  : 'No file selected.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
