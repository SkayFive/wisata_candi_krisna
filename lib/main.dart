import 'package:flutter/material.dart';
import 'package:wisata_candi_krisna/screens/home_screen.dart';
// import 'package:wisata_candi_krisna/screens/profile_screen.dart';
// import 'package:wisata_candi_krisna/screens/home_screen.dart';
// import 'package:wisata_candi_krisna/data/candi_data.dart';
// import 'package:wisata_candi_krisna/screens/detail_screen.dart';
// import 'package:wisata_candi_krisna/screens/search_screen.dart';
// import 'package:wisata_candi_krisna/screens/signIn_screen.dart';
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
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.deepPurple),
          titleTextStyle: TextStyle(
            color: Colors.deepPurple,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ).copyWith(primary: Colors.deepPurple, surface: Colors.deepPurple[50]),
      ),
      home: HomeScreen(),
      // home: SignInScreen(),
   );
 }
}
