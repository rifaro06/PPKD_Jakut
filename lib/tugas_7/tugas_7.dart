import 'package:flutter/material.dart';

import 'checkbox_page.dart';
import 'switch_page.dart';
import 'dropdown_page.dart';
import 'date_picker_page.dart';
import 'time_picker_page.dart';

class Tugas7 extends StatefulWidget {
  const Tugas7({super.key});

  @override
  State<Tugas7> createState() => _Tugas7State();
}

class _Tugas7State extends State<Tugas7> {
  int halamanAktif = 0;

  final List<String> judulHalaman = [
    'Syarat & Ketentuan',
    'Mode Gelap',
    'Pilih Kategori Produk',
    'Pilih Tanggal Lahir',
    'Atur Pengingat',
  ];

  final List<Widget> halaman = [
    const CheckboxPage(),
    const SwitchPage(),
    const DropdownPage(),
    const DatePickerPage(),
    const TimePickerPage(),
  ];

  final List<IconData> ikonMenu = [
    Icons.check_box,
    Icons.dark_mode,
    Icons.category,
    Icons.calendar_today,
    Icons.access_time,
  ];

  void pilihHalaman(int index) {
    setState(() {
      halamanAktif = index;
    });

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(judulHalaman[halamanAktif]),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.assignment,
                    color: Colors.white,
                    size: 50,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Tugas 7 Flutter',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            for (int i = 0; i < judulHalaman.length; i++)
              ListTile(
                leading: Icon(ikonMenu[i]),
                title: Text(judulHalaman[i]),
                selected: halamanAktif == i,
                onTap: () => pilihHalaman(i),
              ),
          ],
        ),
      ),

      body: halaman[halamanAktif],
    );
  }
}