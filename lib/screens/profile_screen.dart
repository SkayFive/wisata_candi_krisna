// import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:wisata_candi_krisna/widgets/profile_into_item.dart';
// import 'package:flutter/services.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // TODO: 1 Deklarasi variabel yang dibuthkan
  bool isSignedIn = false;
  String fullName = '';
  String userName = '';
  int favoriteCandiCount = 0;
  late Color IconColor;

  // TODO: 5. Implementasi fungsi signin
  void signIn() {
    // setState(() {
    //   isSignedIn = !isSignedIn;
    // });
    Navigator.pushNamed(context, '/signin');
  }

  //TODO: 6. Implementasi fungsi signout
  void signOut() {
    setState(() {
      isSignedIn = !isSignedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            color: Colors.deepPurple,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                // TODO: 2 Buat Bagian ProfileHeader yang berisi Gambar
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 200 - 50),
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.deepPurple,
                              width: 2,
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage(
                              'images/placeholder_image.png',
                            ),
                          ),
                        ),
                        if (isSignedIn)
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.camera_alt,
                              color: Colors.deepPurple[200],
                            ),
                          ),
                      ],
                    ),
                  ),
                ),

                // TODO: 3 Buat bagian ProfileInfo yang berisi info profil
                SizedBox(height: 20),
                Divider(color: Colors.deepPurple[100]),
                SizedBox(height: 10),
                ProfileIntoItem(
                  icon: Icons.lock,
                  label: 'Pengguna',
                  value: userName,
                  // showEditIcon: isSignedIn,
                  onEditPressed: () {
                    debugPrint('Icon Edit Ditekan');
                  },
                  iconColor: Colors.amber,
                ),
                SizedBox(height: 4),
                Divider(color: Colors.deepPurple[100]),

                SizedBox(height: 10),
                ProfileIntoItem(
                  icon: Icons.person,
                  label: 'Nama',
                  value: fullName,
                  showEditIcon: isSignedIn,
                  onEditPressed: () {
                    debugPrint('Icon Edit Ditekan');
                  },
                  iconColor: Colors.blue,
                ),
                SizedBox(height: 4),
                Divider(color: Colors.deepPurple[100]),

                SizedBox(height: 10),
                ProfileIntoItem(
                  icon: Icons.favorite,
                  label: 'favorite',
                  value: favoriteCandiCount,
                  // showEditIcon: isSignedIn,
                  onEditPressed: () {
                    debugPrint('Icon Edit Ditekan');
                  },
                  iconColor: Colors.red,
                ),

                // TODO: 4 Buat profileAction yang berisi TextButton sign in/out
                SizedBox(height: 4),
                Divider(color: Colors.deepPurple[100]),

                SizedBox(height: 20),
                isSignedIn
                    ? TextButton(onPressed: (signOut), child: Text('Sign Out'))
                    : TextButton(onPressed: (signIn), child: Text('Sign In')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
