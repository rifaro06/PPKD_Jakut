import 'package:flutter/material.dart';

import 'login.dart';
import '../service/shared_preference_service.dart';

/// Halaman utama setelah pengguna berhasil login.
class Home extends StatefulWidget {
  /// Membuat halaman Home.
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home : Belajar local Storage'),
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          const Text('Nama Saya : '),
          const Text('Alamat Email : '),
          const Text('Hobi Saya : '),
          Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  await SharedPreferenceService().setLoginStatus(false);

                  if (!context.mounted) {
                    return;
                  }

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Login(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Logout'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}