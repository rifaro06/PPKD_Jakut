import 'package:flutter/material.dart';

class ListMapKategoriPage extends StatelessWidget {
  const ListMapKategoriPage({super.key});

  final List<Map<String, dynamic>> kategori = const [
    {
      'nama': 'Buah-buahan',
      'icon': Icons.apple,
    },
    {
      'nama': 'Sayuran',
      'icon': Icons.eco,
    },
    {
      'nama': 'Elektronik',
      'icon': Icons.devices,
    },
    {
      'nama': 'Pakaian Pria',
      'icon': Icons.checkroom,
    },
    {
      'nama': 'Pakaian Wanita',
      'icon': Icons.shopping_bag,
    },
    {
      'nama': 'Alat Tulis Kantor',
      'icon': Icons.edit,
    },
    {
      'nama': 'Buku & Majalah',
      'icon': Icons.menu_book,
    },
    {
      'nama': 'Peralatan Dapur',
      'icon': Icons.kitchen,
    },
    {
      'nama': 'Makanan Ringan',
      'icon': Icons.fastfood,
    },
    {
      'nama': 'Minuman',
      'icon': Icons.local_drink,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: kategori.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(kategori[index]['icon']),
          title: Text(kategori[index]['nama']),
        );
      },
    );
  }
}