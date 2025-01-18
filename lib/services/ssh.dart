import 'dart:async'; // For using Future
import 'dart:io'; // For using File
import 'package:shared_preferences/shared_preferences.dart';  // For using shared preferences
import 'package:dartssh2/dartssh2.dart'; // For using SSH



class SSH{

  //Connection details
  late String _host; 
  late String _port;
  late String _username;
  late String _passwordOrKey;
  late String _numberOfRigs;
  SSHClient? _client; // _client is the SSH client

  //Constructor to set the connection details from the shared preferences
   Future<void> initConnectionDetails() async { // Future<void> means that the function will return nothing and it is asynchronous
    final SharedPreferences prefs = await SharedPreferences.getInstance(); // Get the shared preferences instance

    // Get the connection details from the shared preferences
    _host = prefs.getString('ipAddress') ?? '192.167.56.3';
    _port = prefs.getString('sshPort') ?? '22';
    _username = prefs.getString('username') ?? 'lg';
    _passwordOrKey = prefs.getString('password') ?? 'lg';
    _numberOfRigs = prefs.getString('numberOfRigs') ?? '3';
  }

  //Function to connect to the LG
  Future<bool?> connectToLG() async { // Future<bool?> means that the function will return a boolean value and it is asynchronous
    await initConnectionDetails(); // Initialize the connection details by calling the initConnectionDetails function

    try {
      final socket = await SSHSocket.connect(_host, int.parse(_port)); // Connect to the Liquid Galaxy using the SSHSocket

      // Initialize the SSH client
      _client = SSHClient(
        socket,
        username: _username,
        onPasswordRequest: () => _passwordOrKey,
      );
      print('$_host,  $_passwordOrKey,  $_username,  $_port, $_numberOfRigs');
      return true;
    } on SocketException catch (e) {
      print('Failed to connect: $e');
      return false;
    }
  }

  //Function to send the command to the LG
  Future<SSHSession?> execute(cmd, successMessage) async { // execute function to execute a command on the Liquid Galaxy
    try { // try-catch block to handle exceptions that may occur while executing the command
      if (_client == null) { // Check if the SSH client is initialized or not
        print('SSH client is not initialized.');
        return null; // Return null if the SSH client is not initialized to indicate that the command execution failed
      }
      final result = await _client!.execute(cmd); // Execute the command using the SSH client and store the result
      print(successMessage);
      return result; // Return the result of the command execution
    } catch (e) {
      print('An error occurred while executing the command: $e');
      return null;  // Return null to indicate that the command execution failed
    }
  }

  //Function to shutdown from the LG
   Future<void> shutdown() async {
    for (int i = 1; i <= int.parse(_numberOfRigs); i++) { // Loop through each rig to send the shutdown command
      final shutdownCommand = 'sshpass -p $_passwordOrKey ssh -t lg$i "echo $_passwordOrKey | sudo -S shutdown now"';
      
      // Execute the shutdown command for each rig
      await execute(shutdownCommand, 'Liquid Galaxy $i shutdown successfully');
    }
  }

  //Function to reboot the LG
   Future<SSHSession?> relaunchLG() async {
    final relaunchCmd = """
        RELAUNCH_CMD="\\
        if [ -f /etc/init/lxdm.conf ]; then
          export SERVICE=lxdm
        elif [ -f /etc/init/lightdm.conf ]; then
          export SERVICE=lightdm
        else
          exit 1
        fi

        if [[ \\\$(service \\\$SERVICE status) =~ 'stop' ]]; then
          echo $_passwordOrKey | sudo -S service \\\${SERVICE} start
        else
          echo $_passwordOrKey | sudo -S service \\\${SERVICE} restart
        fi
        " && sshpass -p $_passwordOrKey ssh -x -t lg@lg1 "\$RELAUNCH_CMD\"""";

    return await execute(relaunchCmd, 'Liquid Galaxy relaunched successfully');
  }

  Future<void> reboot() async {
    for (int i = 1; i <= int.parse(_numberOfRigs); i++) {
      final rebootCommand =
          'sshpass -p $_passwordOrKey ssh -t lg$i "echo $_passwordOrKey | sudo -S reboot"';
      await execute(rebootCommand, 'Liquid Galaxy $i rebooted successfully');
    }
  }
Future<SSHSession?> clearKML() async {
    String query =
        'echo "exittour=true" > /tmp/query.txt && > /var/www/html/kmls.txt';
    for (var i = 2; i <= int.parse(_numberOfRigs); i++) {
      String blankKml = '''
<?xml version="1.0" encoding="UTF-8"?>
<kml xmlns="http://www.opengis.net/kml/2.2" xmlns:gx="http://www.google.com/kml/ext/2.2" xmlns:kml="http://www.opengis.net/kml/2.2" xmlns:atom="http://www.w3.org/2005/Atom">
  <Document id="slave_$i">
  </Document>
</kml>
    ''';
      query += " && echo '$blankKml' > /var/www/html/kml/slave_$i.kml";
    }
    // final slave2_command = 'echo "" > /var/www/html/kml/slave_2.kml';
    // await execute(
    //     slave2_command, 'Liquid Galaxy cleared KML from slave2 successfully');
    // final slave3_command = 'echo "" > /var/www/html/kml/slave_3.kml';
    // return await execute(
    //     slave3_command, 'Liquid Galaxy cleared KML from slave 3 successfully');
    try {
      await execute(query, 'Liquid Galaxy cleared KML successfully');
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
    return null;
  }

   Future<SSHSession?> teleportToRandomPlace(String placeName) async {
    final teleportCommand = 'echo "search=$placeName" > /tmp/query.txt';
    return await execute(
        teleportCommand, 'Teleported to $placeName successfully');
  }

  
}