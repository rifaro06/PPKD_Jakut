import 'package:flutter/material.dart';

import 'database_helper.dart';
import 'user.dart';

class DaftarUserPage extends StatelessWidget {
  final int refreshKey;

  const DaftarUserPage({
    super.key,
    required this.refreshKey,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<User>>(
      key: ValueKey(refreshKey),
      future: DatabaseHelper.instance.getUsers(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (snapshot.hasError) {
          return Center(
            child: Text(
              'Terjadi kesalahan: ${snapshot.error}',
            ),
          );
        }

        final users = snapshot.data ?? [];

        if (users.isEmpty) {
          return const Center(
            child: Text(
              'Belum ada peserta yang terdaftar.',
            ),
          );
        }

        return ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];

            return Card(
              margin: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 6,
              ),
              child: ListTile(
                leading: CircleAvatar(
                  child: Text(
                    user.nama.isNotEmpty
                        ? user.nama[0].toUpperCase()
                        : '?',
                  ),
                ),
                title: Text(
                  user.nama,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  '${user.email}\n'
                  '${user.nomorHp.isEmpty ? '-' : user.nomorHp}\n'
                  '${user.kota}',
                ),
                isThreeLine: true,
              ),
            );
          },
        );
      },
    );
  }
}