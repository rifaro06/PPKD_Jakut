import 'package:flutter/material.dart';

class TentangPage extends StatelessWidget {
  const TentangPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 30),

          const Icon(
            Icons.flutter_dash,
            size: 80,
            color: Colors.blue,
          ),

          const SizedBox(height: 20),

          const Text(
            'Tugas 8 Flutter',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 15),

          const Text(
            'Aplikasi ini merupakan implementasi navigasi '
            'menggunakan BottomNavigationBar pada Flutter. '
            'Aplikasi memiliki dua tab utama, yaitu Home dan '
            'Tentang Aplikasi.',
            style: TextStyle(
              fontSize: 16,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 30),

          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const Text(
                    'Informasi Aplikasi',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 20),

                  const ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Nama Pembuat'),
                    subtitle: Text('Riez Rafa Roro'),
                  ),

                  const ListTile(
                    leading: Icon(Icons.apps),
                    title: Text('Nama Aplikasi'),
                    subtitle: Text('Tugas 8 Flutter'),
                  ),

                  const ListTile(
                    leading: Icon(Icons.info),
                    title: Text('Versi'),
                    subtitle: Text('1.0.0'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}