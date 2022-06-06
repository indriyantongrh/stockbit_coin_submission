import 'dart:io';

import 'package:flutter/material.dart';
import 'package:scan/scan.dart';
import 'package:wallet_connect/wallet_connect.dart';

class QRScan extends StatefulWidget {
  const QRScan({Key? key}) : super(key: key);

  @override
  _QRScanState createState() => _QRScanState();
}
enum WalletConnectPluginError {
  none,
  allreadyConnected,
  uriError,
  connectedError,
  approveError,
  rejectError,
}

abstract class IWCHandler {
  void onSessionRequest(int? id, String? requestInJson);
  void onSessionDisconnect(String? errInJson);
  //以下不同请求类型具体签名方式见 https://docs.walletconnect.org/json-rpc-api-methods/ethereum
  void onCallRequestPersonalSign(int? id, String? requestInJson);
  void onCallRequestEthSign(int? id, String? requestInJson);
  void onCallRequestEthSignTypedData(int? id, String? requestInJson);
  void onCallRequestEthSendTransaction(int? id, String? requestInJson);
  void onCallRequestEthSignTransaction(int? id, String? requestInJson);
  void onCallRequestEthSendRawTransaction(int? id, String? requestInJson);
  void onError(String? error);
}

class _QRScanState extends State<QRScan> {
  final ScanController controller = ScanController();
  late WCClient _wcClient;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  _initialize() async {
    _wcClient = WCClient(
      // onSessionRequest: _onSessionRequest,
      // onFailure: _onSessionError,
      // onDisconnect: _onSessionClosed,
      // onEthSign: _onSign,
      // onEthSignTransaction: _onSignTransaction,
      // onEthSendTransaction: _onSendTransaction,
      // onCustomRequest: (_, __) {},
      // onConnect: _onConnect,
    );
    // // TODO: Mention walletAddress and privateKey while connecting
    // walletAddress = '';
    // privateKey = '';
    // _textEditingController = TextEditingController();
    // _prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: ScanView(
          controller: controller,
          scanAreaScale: 1,
          scanLineColor: Colors.green.shade400,
          onCapture: (data) {

            Navigator.pop(context, data);
              print(data);
          },
        ),
      ),

    );

  }
  // final connector = WalletConnect(
  //   bridge: 'https://bridge.walletconnect.org',
  //   clientMeta: const PeerMeta(
  //     name: 'WalletConnect',
  //     description: 'WalletConnect Developer App',
  //     url: 'https://walletconnect.org',
  //     icons: [
  //       'https://gblobscdn.gitbook.com/spaces%2F-LJJeCjcLrr53DcT1Ml7%2Favatar.png?alt=media'
  //     ],
  //   ),
  // );



  _qrScanHandler(String value) {
    final session = WCSession.from(value);
    debugPrint('session $session');
    final peerMeta = WCPeerMeta(
      name: "Wallet",
      url: "https://example.walletconnect.org",
      description: "WalletConnect Developer App",
      icons: [
        "https://gblobscdn.gitbook.com/spaces%2F-LJJeCjcLrr53DcT1Ml7%2Favatar.png"
      ],
    );
    _wcClient.connectNewSession(session: session, peerMeta: peerMeta);
    print(_qrScanHandler);
  }



}
