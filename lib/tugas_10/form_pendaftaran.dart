import 'package:flutter/material.dart';
import 'halaman_konfirmasi.dart';

class FormPendaftaranPage extends StatefulWidget {
  const FormPendaftaranPage({super.key});

  @override
  State<FormPendaftaranPage> createState() => _FormPendaftaranPageState();
}

class _FormPendaftaranPageState extends State<FormPendaftaranPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nomorHpController = TextEditingController();
  final TextEditingController _kotaController = TextEditingController();

  @override
  void dispose() {
    _namaController.dispose();
    _emailController.dispose();
    _nomorHpController.dispose();
    _kotaController.dispose();
    super.dispose();
  }

  void _daftar() {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Ringkasan Pendaftaran'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Nama: ${_namaController.text}'),
                const SizedBox(height: 8),
                Text('Email: ${_emailController.text}'),
                const SizedBox(height: 8),
                Text(
                  'Nomor HP: ${_nomorHpController.text.isEmpty ? '-' : _nomorHpController.text}',
                ),
                const SizedBox(height: 8),
                Text('Kota: ${_kotaController.text}'),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Batal'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HalamanKonfirmasiPage(
                        nama: _namaController.text,
                        kota: _kotaController.text,
                      ),
                    ),
                  );
                },
                child: const Text('Lanjut'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Pendaftaran'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const Text(
              'Pendaftaran Aplikasi',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Silakan isi data berikut untuk melakukan pendaftaran.',
            ),

            const SizedBox(height: 24),

            // Nama Lengkap
            TextFormField(
              controller: _namaController,
              decoration: const InputDecoration(
                labelText: 'Nama Lengkap',
                hintText: 'Masukkan nama lengkap',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Nama Lengkap wajib diisi';
                }
                return null;
              },
            ),

            const SizedBox(height: 16),

            // Email
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Email',
                hintText: 'contoh@email.com',
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

            // Nomor HP
            TextFormField(
              controller: _nomorHpController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: 'Nomor HP',
                hintText: 'Masukkan nomor HP (opsional)',
                prefixIcon: Icon(Icons.phone),
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),

            // Kota
            TextFormField(
              controller: _kotaController,
              decoration: const InputDecoration(
                labelText: 'Kota',
                hintText: 'Masukkan kota',
                prefixIcon: Icon(Icons.location_city),
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Kota wajib diisi';
                }
                return null;
              },
            ),

            const SizedBox(height: 24),

            // Tombol Daftar
            SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: _daftar,
                child: const Text(
                  'Daftar',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}