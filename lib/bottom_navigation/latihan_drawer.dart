import 'package:flutter/material.dart';
import 'package:tugas/flutter_widget/latihan_circleavatar.dart';
import 'package:tugas/flutter_widget/latihan_gridview.dart';
import 'package:tugas/flutter_widget/tugas_3.dart';
import 'package:tugas/bottom_navigation/latihan_bottom_navigator.dart';

class LatihanDrawer extends StatefulWidget {
  const LatihanDrawer({super.key});

  @override
  LatihanDrawerState createState() => LatihanDrawerState();
}

class LatihanDrawerState extends State<LatihanDrawer> {
  // Indeks halaman aktif saat ini
  int _selectedIndex = 0;

  // Daftar judul untuk AppBar berdasarkan halaman aktif 
  final List<String> _titles = [
    'Halaman Circle Avatar',
    'Halaman Grid View',
    'Profile Saya',
    'Halaman Bottom Navigator',
  ];
  
  // Daftar widget halaman tujuan
  final List<Widget> _pages = [
    const LatihanCircleavatar(),
    const LatihanGridview(),
    const tugas3(),
    const LatihanBottomNavigator(),
  ];

  // Fungsi untuk mengubah halaman aktif
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedIndex]),
        backgroundColor: Colors.blue,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text("Riez Rafa Roro"),
              accountEmail: Text("wo@email.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  "R",
                  style: TextStyle(fontSize: 40.0, color: Colors.blue),
                ),
              ),
              decoration: BoxDecoration(color: Colors.blue),
            ),
            
            // Menu 1: Circle Avatar (Index 0)
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Latihan Icon Avatar'),
              selected: _selectedIndex == 0,
              onTap: () {
                _onItemTapped(0);
                Navigator.pop(context);
              },
            ),
            
            // Menu 2: Grid View (Index 1)
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Latihan Grid View'),
              selected: _selectedIndex == 1,
              onTap: () {
                _onItemTapped(1);
                Navigator.pop(context);
              },
            ),
            
            // Menu 3: Profile Saya / Tugas 3 (Index 2)
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile Saya'),
              selected: _selectedIndex == 2,
              onTap: () {
                _onItemTapped(2);
                Navigator.pop(context);
              },
            ),
            
            // Menu 4: Bottom Navigator (Index 3)
            ListTile(
              leading: const Icon(Icons.navigation),
              title: const Text('Latihan Bottom Navigator'),
              selected: _selectedIndex == 3,
              onTap: () {
                _onItemTapped(3);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }
}