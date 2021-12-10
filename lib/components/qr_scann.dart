import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ReadQrScreen extends StatefulWidget {
  const ReadQrScreen({Key? key}) : super(key: key);

  @override
  _ReadQrScreenState createState() => _ReadQrScreenState();
}

class _ReadQrScreenState extends State<ReadQrScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR_READER');

  QRViewController? controller;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) controller!.pauseCamera();
    if (Platform.isIOS) controller!.resumeCamera();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((Barcode scanData) {
      if (scanData.format == BarcodeFormat.qrcode && scanData.code.isNotEmpty) {
        final String _barcode = scanData.code;

        const String keyword = 'kaspersky';
        bool valid = _barcode.contains(keyword);

        if (valid) {
          controller.stopCamera();
          // Navigator.of(context).pushReplacement(
          //   MaterialPageRoute(
          //     builder: (context) => TransactionScreen(barcode: _barcode),
          //   ),
          // );
          log('dfghjkl');
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final QRView _scanner = QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(borderColor: Colors.white),
      formatsAllowed: const [BarcodeFormat.qrcode],
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Escanea el codigo QR')),
      body: Column(
        children: [Expanded(flex: 5, child: _scanner)],
      ),
    );
  }
}
