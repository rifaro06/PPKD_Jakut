import 'package:flutter/material.dart';
import '../models/got_model.dart';

class GotDetailScreen extends StatelessWidget {
  final GotCharacterModel character;

  const GotDetailScreen({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(character.fullName, style: const TextStyle(color: Colors.white)),
        backgroundColor: Colors.black87,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Foto Profil Karakter Ukuran Besar
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  character.imageUrl,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.person, size: 100),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Card Informasi Detail Karakter
            Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.person),
                      title: const Text('Nama Lengkap'),
                      subtitle: Text(character.fullName),
                    ),
                    const Divider(),
                    ListTile(
                      leading: const Icon(Icons.work),
                      title: const Text('Gelar / Title'),
                      subtitle: Text(
                        character.title.isEmpty ? '-' : character.title,
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      leading: const Icon(Icons.house),
                      title: const Text('Keluarga / Family'),
                      subtitle: Text(
                        character.family.isEmpty ? '-' : character.family,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}