import 'package:flutter/material.dart';
import 'package:wisata_candi_krisna/screens/favorite_screen.dart';
import 'package:wisata_candi_krisna/screens/signIn_screen.dart';
import 'package:wisata_candi_krisna/screens/signUp_screen_.dart';
import 'package:wisata_candi_krisna/screens/home_screen.dart';
import 'package:wisata_candi_krisna/screens/profile_screen.dart';
import 'package:wisata_candi_krisna/screens/search_screen.dart';

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
        useMaterial3: true,
      ),
      initialRoute: '/signin',
      routes: {
        '/': (context) => const MainScreen(),
        '/signin': (context) => SignInScreen(),
        '/signup': (context) => const SignUpScreen(),
      },
    );
  }
}

// Implementasi halaman utama
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  //TODO: 1.Delarasi Variabel
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeScreen(),
    SearchScreen(),
    FavoriteScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO: 2. Buat properti body berupa widget yang di tampilkan
      body: _children[_currentIndex],
      //TODO: 3. Buat properti buttomNavigationBar dengan nilai Theme
      bottomNavigationBar: Theme(
        //TODO: 4. Buat data dan child dari Theme
        data: Theme.of(context).copyWith(canvasColor: Colors.white),
        // Membuat item bisa di tekan di buat sebelum menulis item
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.deepPurple),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search, color: Colors.deepPurple),
              label: 'search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite, color: Colors.deepPurple),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.deepPurple),
              label: 'Person',
            ),
          ],
          selectedItemColor:
              Colors.deepPurple, // Mengatur Warna Teks saat di klik
          unselectedItemColor:
              Colors.deepPurple[100], //Mengatur warna ketika belum di klik
          showSelectedLabels:
              true, // Menunjukan menampilkan label (teks) dari item yang sedang dipilih.
        ),
      ),
    );
  }
}
