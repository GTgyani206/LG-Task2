import 'package:flutter/material.dart';
import 'package:lg_task2/services/ssh.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConnectionScreen extends StatefulWidget {
  const ConnectionScreen({super.key});
  
  @override
  State<ConnectionScreen> createState() => _ConnectionScreenState();
}

class _ConnectionScreenState extends State<ConnectionScreen> {
  // Instance of the SSH class
  SSH ssh = SSH();
  // Connection status
  bool connectionStatus = false;

  // Connect to Liquid Galaxy
  Future<void> _connectToLG() async {
    try {
      // Ensure we don't create a new instance on every connection attempt
      bool? result = await ssh.connectToLG();
      if (result == true) {
        setState(() {
          connectionStatus = true;
        });
      }else{
        setState(() {
          connectionStatus = false;
        });
      }
    } catch (e) {
      _showErrorDialog('Connection Error', e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    ssh = SSH(); // Initialize SSH object
    _loadSettings(); // Load saved settings
    // _connectToLG(); // Removed initial connection attempt, now handled after user action
  }

  // Controllers for input fields
  final TextEditingController _ipController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _sshPortController = TextEditingController();
  final TextEditingController _rigsController = TextEditingController();

  @override
  void dispose() {
    // Dispose controllers
    _ipController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _sshPortController.dispose();
    _rigsController.dispose();
    super.dispose();
  }

  // Load settings from shared preferences
  Future<void> _loadSettings() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _ipController.text = prefs.getString('ipAddress') ?? '';
      _usernameController.text = prefs.getString('username') ?? '';
      _passwordController.text = prefs.getString('password') ?? '';
      _sshPortController.text = prefs.getString('sshPort') ?? '';
      _rigsController.text = prefs.getString('numberOfRigs') ?? '';
    });
  }

  // Save settings to shared preferences
  Future<void> _saveSettings() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('ipAddress', _ipController.text);
    await prefs.setString('username', _usernameController.text);
    await prefs.setString('password', _passwordController.text);
    await prefs.setString('sshPort', _sshPortController.text);
    await prefs.setString('numberOfRigs', _rigsController.text);
  }

  // Save settings and attempt connection
  Future<void> _connectToLGDialogue() async {
    try {
      await _saveSettings();// Save settings before attempting to connect
      await _connectToLG();  // Call the actual connection method

      _showStatusDialog(connectionStatus);
    } catch (e) {
      _showErrorDialog('Connection Error', e.toString());
    }
  }

  // Show status dialog
  void _showStatusDialog(bool isConnected) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Connection Status'),
          content: Text(isConnected
              ? 'Connected to Liquid Galaxy'
              : 'Failed to connect to Liquid Galaxy'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  // Show error dialog
  void _showErrorDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Connect to LG'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            ListTile(
              title: const Text('Connection Status'),
              trailing: ConnectionIndicator(isOnline: connectionStatus),
            ),
            const SizedBox(height: 16),
            _buildInputTile('IP Address', 'eg. 192.168.56.3', _ipController),
            const SizedBox(height: 16),
            _buildInputTile('Username', 'lg', _usernameController),
            const SizedBox(height: 16),
            _buildInputTile('Password', '12', _passwordController, isPassword: true),
            const SizedBox(height: 16),
            _buildInputTile('SSH Port', '22', _sshPortController),
            const SizedBox(height: 16),
            _buildInputTile('Number of Rigs', '3', _rigsController),
            const SizedBox(height: 24),
            ListTile(
              title: Center(
                child: ElevatedButton(
                  onPressed: _connectToLGDialogue,  // Directly call connection dialogue method
                  child: const Text('Connect to LG'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Build input tile
  Widget _buildInputTile(String title, String hintText, TextEditingController controller, {bool isPassword = false}) {
    return ListTile(
      title: Text(title),
      subtitle: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(),
        ),
        obscureText: isPassword,
      ),
    );
  }
}

// Mocked ConnectionIndicator Widget
class ConnectionIndicator extends StatelessWidget {
  final bool isOnline;

  const ConnectionIndicator({super.key, required this.isOnline});

  @override
  Widget build(BuildContext context) {
    return Icon(
      isOnline ? Icons.check_circle : Icons.cancel,
      color: isOnline ? Colors.green : Colors.red,
    );
  }
}
