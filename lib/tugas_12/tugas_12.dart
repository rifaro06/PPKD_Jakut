import 'package:flutter/material.dart';

import 'daftar_user.dart';
import 'form_user.dart';

class Tugas12Page extends StatefulWidget {
  const Tugas12Page({super.key});

  @override
  State<Tugas12Page> createState() => _Tugas12PageState();
}

class _Tugas12PageState extends State<Tugas12Page> {
  int _refreshKey = 0;

  void _refreshData() {
    setState(() {
      _refreshKey++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tugas 12 - Database User'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: FormUserPage(
              onUserAdded: _refreshData,
            ),
          ),

          const Divider(),

          const Padding(
            padding: EdgeInsets.all(12),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Daftar Peserta',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          Expanded(
            flex: 3,
            child: DaftarUserPage(
              refreshKey: _refreshKey,
            ),
          ),
        ],
      ),
    );
  }
}