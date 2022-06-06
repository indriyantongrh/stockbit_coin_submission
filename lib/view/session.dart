import 'package:flutter/material.dart';

class session extends StatefulWidget {
  const session({Key? key}) : super(key: key);

  @override
  State<session> createState() => _sessionState();
}

class _sessionState extends State<session> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('Session'),
      ),
      body: Container(
        child: Column(
          children: [
            Text("Session")
          ],
        ),
      ),      
    );
  }
}
