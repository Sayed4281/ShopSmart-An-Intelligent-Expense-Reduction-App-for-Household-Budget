import 'package:flutter/material.dart';
import 'home_admin.dart';
import 'home_user.dart';
import 'home_shop.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Login Page',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to the admin login page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginForm(role: 'admin')),
                );
              },
              child: Text('Login as Admin'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to the user login page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginForm(role: 'user')),
                );
              },
              child: Text('Login as User'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to the shopper login page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginForm(role: 'shopper')),
                );
              },
              child: Text('Login as Shopper'),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  final String role;

  const LoginForm({Key? key, required this.role}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late String _email;
  late String _password;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _email = '';
    _password = '';
    _errorMessage = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login as ${widget.role.capitalize()}'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              onChanged: (value) {
                setState(() {
                  _email = value;
                  _errorMessage = null; // Reset error message when email changes
                });
              },
              decoration: InputDecoration(
                labelText: 'Email',
                errorText: _errorMessage,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              onChanged: (value) {
                setState(() {
                  _password = value;
                  _errorMessage = null; // Reset error message when password changes
                });
              },
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                errorText: _errorMessage,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Validate login credentials
                if (_validateCredentials()) {
                  // Navigate to the respective home page based on the role
                  switch (widget.role) {
                    case 'admin':
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomeAdminPage()),
                      );
                      break;
                    case 'user':
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomeUsePage()),
                      );
                      break;
                    case 'shopper':
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomeShopPage()),
                      );
                      break;
                  }
                }
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }

  bool _validateCredentials() {
    // Perform login validation based on the entered email and password
    // For demonstration purposes, hardcoded email and password combinations are used
    switch (widget.role) {
      case 'admin':
        if (_email == 'admin' && _password == 'admin') {
          return true;
        } else {
          setState(() {
            _errorMessage = 'Incorrect email or password';
          });
          return false;
        }
      case 'user':
        if (_email == 'user' && _password == 'user') {
          return true;
        } else {
          setState(() {
            _errorMessage = 'Incorrect email or password';
          });
          return false;
        }
      case 'shopper':
        if (_email == 'shopper' && _password == 'shopper') {
          return true;
        } else {
          setState(() {
            _errorMessage = 'Incorrect email or password';
          });
          return false;
        }
      default:
        return false;
    }
  }
}

HomeUsePage() {
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}
