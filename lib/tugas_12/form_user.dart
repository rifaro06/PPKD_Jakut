import 'package:flutter/material.dart';

import 'database_helper.dart';
import 'user.dart';

class FormUserPage extends StatefulWidget {
  final VoidCallback onUserAdded;

  const FormUserPage({
    super.key,
    required this.onUserAdded,
  });

  @override
  State<FormUserPage> createState() => _FormUserPageState();
}

class _FormUserPageState extends State<FormUserPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nomorHpController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _kotaController = TextEditingController();

  @override
  void dispose() {
    _namaController.dispose();
    _emailController.dispose();
    _nomorHpController.dispose();
    _passwordController.dispose();
    _kotaController.dispose();
    super.dispose();
  }

  Future<void> _simpanUser() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final user = User(
      nama: _namaController.text.trim(),
      email: _emailController.text.trim(),
      nomorHp: _nomorHpController.text.trim(),
      password: _passwordController.text,
      kota: _kotaController.text.trim(),
    );

    await DatabaseHelper.instance.insertUser(user);

    _namaController.clear();
    _emailController.clear();
    _nomorHpController.clear();
    _passwordController.clear();
    _kotaController.clear();

    widget.onUserAdded();

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Data berhasil disimpan'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          TextFormField(
            controller: _namaController,
            decoration: const InputDecoration(
              labelText: 'Nama',
              prefixIcon: Icon(Icons.person),
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Nama wajib diisi';
              }

              return null;
            },
          ),

          const SizedBox(height: 16),

          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              labelText: 'Email',
              prefixIcon: Icon(Icons.email),
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Email wajib diisi';
              }

              if (!value.contains('@')) {
                return 'Email harus mengandung @';
              }

              return null;
            },
          ),

          const SizedBox(height: 16),

          TextFormField(
            controller: _nomorHpController,
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(
              labelText: 'Nomor HP',
              prefixIcon: Icon(Icons.phone),
              border: OutlineInputBorder(),
            ),
          ),

          const SizedBox(height: 16),

          TextFormField(
            controller: _passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Password',
              prefixIcon: Icon(Icons.lock),
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Password wajib diisi';
              }

              return null;
            },
          ),

          const SizedBox(height: 16),

          TextFormField(
            controller: _kotaController,
            decoration: const InputDecoration(
              labelText: 'Asal Kota',
              prefixIcon: Icon(Icons.location_city),
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Asal Kota wajib diisi';
              }

              return null;
            },
          ),

          const SizedBox(height: 24),

          SizedBox(
            height: 50,
            child: ElevatedButton(
              onPressed: _simpanUser,
              child: const Text(
                'Daftar',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}