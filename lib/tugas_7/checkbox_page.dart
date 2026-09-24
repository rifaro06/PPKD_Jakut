import 'package:flutter/material.dart';

class CheckboxPage extends StatefulWidget {
  const CheckboxPage({super.key});

  @override
  State<CheckboxPage> createState() => _CheckboxPageState();
}

class _CheckboxPageState extends State<CheckboxPage> {
  bool disetujui = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Syarat & Ketentuan',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          CheckboxListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text(
              'Saya menyetujui semua persyaratan yang berlaku',
            ),
            value: disetujui,
            onChanged: (value) {
              setState(() {
                disetujui = value ?? false;
              });
            },
          ),

          const SizedBox(height: 20),

          Text(
            disetujui
                ? 'Lanjutkan pendaftaran diperbolehkan'
                : 'Anda belum bisa melanjutkan',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: disetujui ? Colors.green : Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}