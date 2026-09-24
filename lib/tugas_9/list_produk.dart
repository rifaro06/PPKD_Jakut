import 'package:flutter/material.dart';

class Produk {
  final String nama;
  final String kategori;
  final String deskripsi;
  final String gambar;

  const Produk({
    required this.nama,
    required this.kategori,
    required this.deskripsi,
    required this.gambar,
  });
}

const List<Produk> produk = [
  Produk(
    nama: 'Laptop',
    kategori: 'Elektronik',
    deskripsi: 'Laptop untuk kebutuhan belajar dan bekerja.',
    gambar:
        'https://images.unsplash.com/photo-1496181133206-80ce9b88a853',
  ),
  Produk(
    nama: 'Smartphone',
    kategori: 'Elektronik',
    deskripsi: 'Smartphone untuk komunikasi dan kebutuhan sehari-hari.',
    gambar:
        'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9',
  ),
  Produk(
    nama: 'Headphone',
    kategori: 'Elektronik',
    deskripsi: 'Headphone untuk mendengarkan musik dengan nyaman.',
    gambar:
        'https://images.unsplash.com/photo-1505740420928-5e560c06d30e',
  ),
  Produk(
    nama: 'Keyboard',
    kategori: 'Elektronik',
    deskripsi: 'Keyboard untuk mengetik dan bekerja menggunakan komputer.',
    gambar:
        'https://images.unsplash.com/photo-1587829741301-dc798b83add3',
  ),
  Produk(
    nama: 'Mouse',
    kategori: 'Elektronik',
    deskripsi: 'Mouse untuk mengontrol komputer dengan mudah.',
    gambar:
        'https://images.unsplash.com/photo-1527814050087-3793815479db',
  ),
  Produk(
    nama: 'Monitor',
    kategori: 'Elektronik',
    deskripsi: 'Monitor untuk menampilkan tampilan komputer.',
    gambar:
        'https://images.unsplash.com/photo-1527443224154-c4a3942d3acf',
  ),
  Produk(
    nama: 'Speaker',
    kategori: 'Elektronik',
    deskripsi: 'Speaker untuk menghasilkan suara yang lebih jelas.',
    gambar:
        'https://images.unsplash.com/photo-1545454675-3531b543be5d',
  ),
  Produk(
    nama: 'Kamera',
    kategori: 'Elektronik',
    deskripsi: 'Kamera untuk mengambil foto dan video.',
    gambar:
        'https://images.unsplash.com/photo-1516035069371-29a1b244cc32',
  ),
  Produk(
    nama: 'Smartwatch',
    kategori: 'Elektronik',
    deskripsi: 'Smartwatch untuk membantu aktivitas sehari-hari.',
    gambar:
        'https://images.unsplash.com/photo-1523275335684-37898b6baf30',
  ),
  Produk(
    nama: 'Tablet',
    kategori: 'Elektronik',
    deskripsi: 'Tablet untuk belajar, bekerja, dan hiburan.',
    gambar:
        'https://images.unsplash.com/photo-1544244015-0df4b3ffc6b0',
  ),
];

class ListProduk extends StatelessWidget {
  final Produk produk;

  const ListProduk({
    super.key,
    required this.produk,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 6,
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(10),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            produk.gambar,
            width: 80,
            height: 80,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                width: 80,
                height: 80,
                color: Colors.grey[300],
                child: const Icon(
                  Icons.image_not_supported,
                ),
              );
            },
          ),
        ),
        title: Text(
          produk.nama,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Text(
            '${produk.kategori}\n${produk.deskripsi}',
          ),
        ),
      ),
    );
  }
}