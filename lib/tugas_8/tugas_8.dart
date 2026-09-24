import 'package:flutter/material.dart';

import '../tugas_7/tugas_7.dart';
import 'tentang_page.dart';

class Tugas8 extends StatefulWidget {
  const Tugas8({super.key});

  @override
  State<Tugas8> createState() => _Tugas8State();
}

class _Tugas8State extends State<Tugas8> {
  int halamanAktif = 0;

  final List<Widget> halaman = [
    const Tugas7(),
    const TentangPage(),
  ];

  final List<String> judulHalaman = [
    'Home',
    'Tentang Aplikasi',
  ];

  void pilihHalaman(int index) {
    setState(() {
      halamanAktif = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(judulHalaman[halamanAktif]),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: halaman[halamanAktif],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: halamanAktif,
        onTap: pilihHalaman,

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Tentang',
          ),
        ],
      ),
    );
  }
}