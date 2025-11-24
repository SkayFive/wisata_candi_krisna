import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  //TODO: 1. Deklarasikan variabel
  final TextEditingController _usernamecontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();

  String _errorText = '';

  bool _isSignedIn = false;

  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO: 2. Pasang AppBar
      appBar: AppBar(title: Text('Sign In')),

      //TODO: 3. Pasang body
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              child: Column(
                //TODO: 4. Atur mainAxisAlignment dan crossAxisAlignment
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //TODO: 5. Pasang TextFormField nama pengguna
                  TextFormField(
                    controller: _usernamecontroller,
                    decoration: InputDecoration(
                      labelText: 'Nama Pengguna',
                      border: OutlineInputBorder(),
                    ),
                  ),

                  //TODO: 6. Pasang TextFormField kata sandi
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _passwordcontroller,
                    decoration: InputDecoration(
                      labelText: 'Kata Sandi',
                      errorText: _errorText.isNotEmpty ? _errorText : null,
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                    ),
                    obscureText: _obscurePassword,
                  ),

                  //TODO: 7. Pasang ElevatedButton untuk sign in
                  SizedBox(height: 20),
                  ElevatedButton(onPressed: () {}, child: Text('Sign In')),

                  //TODO: 8. Pasang TextButton sign up
                  SizedBox(height: 10),
                  // TextButton(
                  //   onPressed: () {},
                  //   child: Text('Belum punya akun? Daftar di sini'),
                  // ),
                  
                  RichText(
                    text: TextSpan(
                      text: 'Belum punya akun? ',
                      style: TextStyle(fontSize: 16, color: Colors.deepPurple),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Daftar di sini',
                          style: TextStyle(
                            color: Colors
                                .blue, // warna untuk teks yang bisa ditekan
                            decoration: TextDecoration.underline,
                            fontSize: 16,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {}, // Aksi ketika teks ditekan
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
