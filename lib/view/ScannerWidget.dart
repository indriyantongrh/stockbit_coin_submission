import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:stockbit_coin_submission/view/QRScan.dart';
import 'dart:io';

import 'package:stockbit_coin_submission/view/Scanner.dart';

class ScannerWidget extends StatefulWidget {
  @override
  _ScannerWidgetState createState() => new _ScannerWidgetState();
}

class _ScannerWidgetState extends State<ScannerWidget> {
  final GlobalKey qrKey = GlobalKey();
  String barcode = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( 'Scan Barcode'),
      ),
      body: Center(
        child: ElevatedButton(
            child: Text('Scan'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Scanner()),
              );
            }),
      ),
    );
  }
}