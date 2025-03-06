import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class QrPage extends StatefulWidget {
  const QrPage({super.key});

  @override
  _QrPageState createState() => _QrPageState();
}

class _QrPageState extends State<QrPage> {
  String _qrCode = "Поместите QR-код в рамку";

  Future<void> _scanQR() async {
    try {
      String qrResult = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666", // Цвет кнопки "Отмена"
        "Отмена",
        true,
        ScanMode.QR,
      );

      if (qrResult != "-1") {
        setState(() {
          _qrCode = qrResult;
        });

        // Если нужно открыть URL, проверьте ссылку:
        if (qrResult.startsWith("http")) {
          // Здесь можно добавить логику перехода по ссылке
          print("Открыть ссылку: $qrResult");
        }
      }
    } catch (e) {
      setState(() {
        _qrCode = "Ошибка сканирования";
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _scanQR();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: const [Icon(Icons.close)],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _qrCode,
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _scanQR,
              child: const Text("Сканировать снова"),
            ),
          ],
        ),
      ),
    );
  }
}
