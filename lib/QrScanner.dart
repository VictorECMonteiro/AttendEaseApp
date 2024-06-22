import 'dart:ffi';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:attendeasemandroid/DartClasses/ApiRequests.dart';

class QrScanner extends StatefulWidget {
  const QrScanner({super.key});

  @override
  State<QrScanner> createState() => _QrScannerState();
}

class _QrScannerState extends State<QrScanner> {
  var contextData;
  int matricula = 0;
  String classe = "";
  int serie = 0;
  String funcaous = "";
  String token = "";




  Barcode? _barcode;


  apiDados(classe) async {
    ApiRequests apiRequests = new ApiRequests(matricula);
    var resultado = await apiRequests.presenceConfirm(contextData['funcao'], contextData['token'], contextData['nome'], classe, contextData['serie'].toString());
    print(resultado);
              Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Presença ou Saída confirmada"))
          );
    return resultado;
  }
  Widget _buildBarcode(Barcode? value) {
  if (value == null) {
    return const Text(
      'Escaneie o QR Code para marcar sua presença',
      overflow: TextOverflow.fade,
      style: TextStyle(color: Colors.white),
    );
  } else {
    return FutureBuilder(
      future: apiDados(value?.displayValue),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text(
            'Erro ao processar: ${snapshot.error}',
            style: TextStyle(color: Colors.red),
          );
        } else {
          var confirmar = snapshot.data;
          
          return Text(
            confirmar.toString(),
            overflow: TextOverflow.fade,
            style: const TextStyle(color: Colors.white),
          );
        }
      },
    );
  }
}

  Future<void> requestPermission() async {
    final permission = Permission.camera;

  if (await permission.isDenied) {
    await permission.request();
  }
}

  void _handleBarcode(BarcodeCapture barcodes) {
    requestPermission();



    if (mounted) {
      setState(() {
        _barcode = barcodes.barcodes.firstOrNull;
      });
    }
  }

  @override
  Widget build(BuildContext context) {





    contextData = ModalRoute.of(context)?.settings.arguments;
    



    return Scaffold(
      appBar: AppBar(title: const Text('Escaneie o Qr code para registrar sua presença')),
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          MobileScanner(
            onDetect: _handleBarcode,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              alignment: Alignment.bottomCenter,
              height: 100,
              color: Colors.black.withOpacity(0.4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(child: Center(child: _buildBarcode(_barcode))),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
