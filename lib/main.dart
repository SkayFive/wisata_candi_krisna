import 'package:flutter/material.dart';
import 'package:wisata_candi_krisna/data/candi_data.dart';
import 'package:wisata_candi_krisna/detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wisata Candi',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: DetailScreen(candi: candiList[0]),
    );
  }
}


