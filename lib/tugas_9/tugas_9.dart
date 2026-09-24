import 'package:flutter/material.dart';

import 'list_kategori.dart';
import 'list_map_kategori.dart';
import 'list_produk.dart';

class Tugas9 extends StatelessWidget {
  const Tugas9({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Tugas 9 - Kategori Toko'),
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          bottom: const TabBar(
            tabs: [
              Tab(text: 'List'),
              Tab(text: 'Map'),
              Tab(text: 'Model'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            ListKategoriPage(),
            ListMapKategoriPage(),
            ListProdukPage(),
          ],
        ),
      ),
    );
  }
}

class ListProdukPage extends StatelessWidget {
  const ListProdukPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: produk.length,
      itemBuilder: (context, index) {
        return ListProduk(
          produk: produk[index],
        );
      },
    );
  }
}