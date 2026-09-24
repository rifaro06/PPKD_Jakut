import 'package:flutter/material.dart';

import '../model/user_model.dart';
import '../service/sqflite_service.dart';
import 'login.dart';

/// Halaman untuk membuat akun baru.
class Register extends StatefulWidget {
  /// Membuat halaman Register.
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();

  final _namaController = TextEditingController();
  final _emailController = TextEditingController();
  final _hobiController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isObscure = true;

  @override
  void dispose() {
    _namaController.dispose();
    _emailController.dispose();
    _hobiController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 24,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Buat Akun Baru',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    'Silahkan lengkapi data diri anda untuk membuat akun pada aplikasi xyz.',
                  ),

                  const SizedBox(height: 24),

                  const Text('NAMA LENGKAP'),

                  const SizedBox(height: 8),

                  TextFormField(
                    controller: _namaController,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                      hintText: 'Ex: Budi Dharmaone',
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.amber,
                      ),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Nama lengkap belum di isi';
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 16),

                  const Text('ALAMAT EMAIL'),

                  const SizedBox(height: 8),

                  TextFormField(
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email belum di isi';
                      }

                      if (!RegExp(
                        r'^[^@\s]+@[^@\s]+\.[^@\s]+$',
                      ).hasMatch(value)) {
                        return 'Format email tidak valid';
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 16),

                  const Text('HOBI / KEGEMARAN'),

                  const SizedBox(height: 8),

                  TextFormField(
                    controller: _hobiController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      hintText: 'Ex: Nonton Drama Korea',
                      prefixIcon: Icon(
                        Icons.accessibility,
                        color: Colors.amber,
                      ),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Kolom Hobi/Kegemaran harus diisi';
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 16),

                  const Text('PASSWORD'),

                  const SizedBox(height: 8),

                  TextFormField(
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password belum di isi';
                      }

                      if (value.length < 6) {
                        return 'Password minimal 6 karakter';
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 24),

                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (!_formKey.currentState!.validate()) {
                            return;
                          }

                          final dataBaru = UserModel(
                            nama: _namaController.text,
                            email: _emailController.text,
                            hobi: _hobiController.text,
                            password: _passwordController.text,
                          );

                          final hasil =
                              await SqfliteService().registerUser(dataBaru);

                          if (!context.mounted) {
                            return;
                          }

                          if (hasil) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Registrasi Berhasil! Silakan Login.',
                                ),
                              ),
                            );

                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Login(),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Registrasi Gagal! Email mungkin sudah terdaftar.',
                                ),
                              ),
                            );
                          }
                        },
                        child: const Text('REGISTER'),
                      ),
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