import 'package:flutter/material.dart';

// ignore: camel_case_types
class tugas3 extends StatelessWidget {
  const tugas3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Profil Saya',
          style: TextStyle(
            fontWeight: FontWeight.bold,

          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Foto profil
            Center(
              child: Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue.shade100,
                  border: Border.all(
                    color: Colors.blue,
                    width: 3,
                  ),
                ),
                child: const Icon(
                  Icons.person,
                  size: 70,
                  color: Colors.blue,
                ),
              ),
            ),

            const SizedBox(height: 25),

            // Nama lengkap
            const Center(
              child: Text(
                'Riez Rafa Roro',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Kota tempat tinggal
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.location_on,
                    color: Colors.blue.shade700,
                    size: 22,
                  ),
                  const SizedBox(width: 6),
                  const Text(
                    'Kemayoran, Jakarta Pusat',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // Deskripsi
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),  
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Text(
                'Saya adalah mahasiswa Informatika yang sedang mengikuti PPKD Android Developper Jakarta Utara.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  height: 1.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}