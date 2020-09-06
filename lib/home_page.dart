import 'package:flutter/material.dart';
import 'auth.dart';

class HomePage extends StatefulWidget {
  HomePage({this.auth, this.onsignedOut});
  final BaseAuth auth;
  final VoidCallback onsignedOut;
  void _signOut() async {
    try {
      await auth.signOut();
      onsignedOut();
    } catch (e) {
      print(e);
    }
  }

  State<StatefulWidget> createState() {
    throw UnimplementedError();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
        actions: [
          FlatButton(
              child: Text('Log out',
                  style: TextStyle(fontSize: 17.0, color: Colors.white)),
              onPressed: _signOut)
        ],
      ),
      body: Container(
        child: Center(
          child: Text(
            'Welcome',
            style: TextStyle(fontSize: 32.0),
          ),
        ),
      ),
    );
  }
}
