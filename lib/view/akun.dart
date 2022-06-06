import 'package:flutter/material.dart';

class akun extends StatefulWidget {
  const akun({Key? key}) : super(key: key);

  @override
  State<akun> createState() => _akunState();
}

class _akunState extends State<akun> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('Account List'),
      ),
      body: Column(
        children: [
          Text("Account List")
        ],
      ),
    );
  }
}

