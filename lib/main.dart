import 'package:flutter/material.dart';
import '../pages/mahasiswa_page.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter With DB',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MahasiswaPage(),
    );
  }
}
