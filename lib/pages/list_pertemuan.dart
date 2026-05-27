import 'package:flutter/material.dart';
import 'pertemuan3.dart';
import 'pertemuan4.dart';
import 'pertemuan5.dart';
import 'pertemuan6.dart';
import 'pertemuan7.dart';
import 'pertemuan8.dart';
import 'pertemuan9.dart';

class ListPertemuanPage extends StatelessWidget {
  const ListPertemuanPage({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> pertemuan = const [
    {'no': 1, 'judul': 'Pengantar Flutter', 'tanggal': 'Minggu 1', 'icon': Icons.mobile_friendly},
    {'no': 2, 'judul': 'Widget Dasar', 'tanggal': 'Minggu 2', 'icon': Icons.widgets},
    {'no': 3, 'judul': 'Layout & Styling', 'tanggal': 'Minggu 3', 'icon': Icons.dashboard},
    {'no': 4, 'judul': 'Toast & Alert Dialog', 'tanggal': 'Minggu 4', 'icon': Icons.notifications},
    {'no': 5, 'judul': 'State Management', 'tanggal': 'Minggu 5', 'icon': Icons.manage_accounts},
    {'no': 6, 'judul': 'CheckBox', 'tanggal': 'Minggu 6', 'icon': Icons.check_box},
    {'no': 7, 'judul': 'RadioButton', 'tanggal': 'Minggu 7', 'icon': Icons.radio_button_checked},
    {'no': 8, 'judul': 'TextField & TextEditingController', 'tanggal': 'Minggu 8', 'icon': Icons.text_fields},
    {'no': 9, 'judul': 'Date & Time Picker', 'tanggal': 'Minggu 9', 'icon': Icons.calendar_today},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Pertemuan'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: pertemuan.length,
        itemBuilder: (context, index) {
          final item = pertemuan[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text(
                  '${item['no']}',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              title: Text(item['judul']),
              subtitle: Text(item['tanggal']),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                if (item['no'] == 3) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Pertemuan3Page()));
                } else if (item['no'] == 4) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Pertemuan4Page()));
                } else if (item['no'] == 5) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Pertemuan5Page()));
                } else if (item['no'] == 6) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Pertemuan6Page()));
                } else if (item['no'] == 7) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Pertemuan7Page()));
                } else if (item['no'] == 8) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Pertemuan8()));
                } else if (item['no'] == 9) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Pertemuan9()));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${item['judul']} dipilih')),
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }
}