import 'package:flutter/material.dart';

class ListKategoriPage extends StatelessWidget {
  const ListKategoriPage({super.key});

  final List<String> kategori = const [
    'Buah-buahan',
    'Sayuran',
    'Elektronik',
    'Pakaian Pria',
    'Pakaian Wanita',
    'Alat Tulis Kantor',
    'Buku & Majalah',
    'Peralatan Dapur',
    'Makanan Ringan',
    'Minuman',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: kategori.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(kategori[index]),
        );
      },
    );
  }
}