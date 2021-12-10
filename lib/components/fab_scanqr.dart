import 'package:bankapp/components/qr_scann.dart';
import 'package:flutter/material.dart';

class FABScannQR extends StatelessWidget {
  const FABScannQR({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.qr_code_scanner_rounded),
      heroTag: 'Scann QR',
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const ReadQrScreen(),
          ),
        );
      },
    );
  }
}
