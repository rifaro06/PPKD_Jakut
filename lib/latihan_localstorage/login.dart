import 'package:flutter/material.dart';

import 'home.dart';
import 'register.dart';
import '../service/shared_preference_service.dart';

/// Halaman login pengguna.
class Login extends StatefulWidget {
  /// Membuat halaman Login.
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isObscure = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),

                const Text(
                  'Selamat Datang',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  'Silahkan login untuk melanjutkan ke aplikasi.',
                ),

                const SizedBox(height: 32),

                const Text('ALAMAT EMAIL'),

                const SizedBox(height: 8),

                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    hintText: 'Ex: budi_one@mail.com',
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.amber,
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 16),

                const Text('PASSWORD'),

                const SizedBox(height: 8),

                TextField(
                  controller: _passwordController,
                  obscureText: _isObscure,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    hintText: 'Masukkan password',
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Colors.amber,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                      icon: Icon(
                        _isObscure
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                    border: const OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 24),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      // Simpan status login.
                      await SharedPreferenceService().setLoginStatus(true);

                      if (!context.mounted) {
                        return;
                      }

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Home(),
                        ),
                      );
                    },
                    child: const Text('LOGIN'),
                  ),
                ),

                const SizedBox(height: 16),

                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Register(),
                        ),
                      );
                    },
                    child: const Text('BUAT AKUN BARU'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}