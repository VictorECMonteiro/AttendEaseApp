import 'package:attendeasemandroid/LoginScreen.dart';
import 'package:attendeasemandroid/QrScanner.dart';
import 'package:attendeasemandroid/UserScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Rotas',
    initialRoute: '/',
    home: LoginScreen(),
    routes: {
      '/user':(_) => UserScreen(),
      '/scan':(_)=> QrScanner()
    },
    
    ));
}

