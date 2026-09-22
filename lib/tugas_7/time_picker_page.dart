import 'package:flutter/material.dart';

class TimePickerPage extends StatefulWidget {
  const TimePickerPage({super.key});

  @override
  State<TimePickerPage> createState() => _TimePickerPageState();
}

class _TimePickerPageState extends State<TimePickerPage> {
  TimeOfDay? waktuPengingat;

  Future<void> pilihWaktu() async {
    final waktu = await showTimePicker(
      context: context,
      initialTime: const TimeOfDay(hour: 7, minute: 30),
    );

    if (waktu != null) {
      setState(() {
        waktuPengingat = waktu;
      });
    }
  }

  String formatWaktu(TimeOfDay waktu) {
    final jam = waktu.hourOfPeriod == 0 ? 12 : waktu.hourOfPeriod;
    final menit = waktu.minute.toString().padLeft(2, '0');
    final periode = waktu.period == DayPeriod.am ? 'AM' : 'PM';

    return '$jam:$menit $periode';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Atur Pengingat',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          ElevatedButton.icon(
            onPressed: pilihWaktu,
            icon: const Icon(Icons.access_time),
            label: const Text('Pilih Waktu Pengingat'),
          ),

          const SizedBox(height: 20),

          if (waktuPengingat != null)
            Text(
              'Pengingat diatur pukul: ${formatWaktu(waktuPengingat!)}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
        ],
      ),
    );
  }
}