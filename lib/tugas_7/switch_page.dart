import 'package:flutter/material.dart';

class SwitchPage extends StatefulWidget {
  const SwitchPage({super.key});

  @override
  State<SwitchPage> createState() => _SwitchPageState();
}

class _SwitchPageState extends State<SwitchPage> {
  bool modeGelap = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: modeGelap ? Colors.grey[900] : Colors.white,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Mode Gelap',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: modeGelap ? Colors.white : Colors.black,
            ),
          ),

          const SizedBox(height: 20),

          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              'Aktifkan Mode Gelap',
              style: TextStyle(
                color: modeGelap ? Colors.white : Colors.black,
              ),
            ),
            value: modeGelap,
            onChanged: (value) {
              setState(() {
                modeGelap = value;
              });
            },
          ),

          const SizedBox(height: 20),

          Text(
            modeGelap ? 'Mode Gelap Aktif' : 'Mode Terang Aktif',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: modeGelap ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}