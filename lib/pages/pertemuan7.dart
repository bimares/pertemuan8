import 'package:flutter/material.dart';

class Pertemuan7Page extends StatefulWidget {
  const Pertemuan7Page({super.key});

  @override
  State<Pertemuan7Page> createState() => _Pertemuan7PageState();
}

class _Pertemuan7PageState extends State<Pertemuan7Page> {
  // Untuk menyimpan pilihan jenis kelamin
  String? _jenisKelamin;
  
  // Untuk menyimpan pilihan status
  String? _status;
  
  // Untuk menyimpan pilihan ukuran baju
  String? _ukuranBaju;
  
  // Untuk menyimpan pilihan mode (dengan null value / toggleable)
  String? _mode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pertemuan 7: RadioButton'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Judul
            const Text(
              'Contoh Penggunaan RadioButton',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'RadioButton digunakan untuk memilih SATU opsi dari beberapa pilihan',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const Divider(height: 32),
            
            // ========== CONTOH 1: RadioListTile (Jenis Kelamin) ==========
            const Text(
              '1. Jenis Kelamin (RadioListTile)',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    RadioListTile(
                      title: const Text('Laki-laki'),
                      value: 'Laki-laki',
                      groupValue: _jenisKelamin,
                      onChanged: (value) {
                        setState(() {
                          _jenisKelamin = value;
                        });
                      },
                      activeColor: Colors.blue,
                    ),
                    RadioListTile(
                      title: const Text('Perempuan'),
                      value: 'Perempuan',
                      groupValue: _jenisKelamin,
                      onChanged: (value) {
                        setState(() {
                          _jenisKelamin = value;
                        });
                      },
                      activeColor: Colors.blue,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            
            // ========== CONTOH 2: Radio Horizontal (Ukuran Baju) ==========
            const Text(
              '2. Ukuran Baju (Radio Horizontal)',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildHorizontalRadio('S'),
                    _buildHorizontalRadio('M'),
                    _buildHorizontalRadio('L'),
                    _buildHorizontalRadio('XL'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            
            // ========== CONTOH 3: Radio Toggleable (Status) ==========
            const Text(
              '3. Status (Toggleable - bisa di-unselect)',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    RadioListTile(
                      title: const Text('Mahasiswa'),
                      value: 'Mahasiswa',
                      groupValue: _status,
                      onChanged: (value) {
                        setState(() {
                          _status = value;
                        });
                      },
                      activeColor: Colors.green,
                      toggleable: true, // Bisa di-unselect
                    ),
                    RadioListTile(
                      title: const Text('Dosen'),
                      value: 'Dosen',
                      groupValue: _status,
                      onChanged: (value) {
                        setState(() {
                          _status = value;
                        });
                      },
                      activeColor: Colors.green,
                      toggleable: true,
                    ),
                    RadioListTile(
                      title: const Text('Profesional'),
                      value: 'Profesional',
                      groupValue: _status,
                      onChanged: (value) {
                        setState(() {
                          _status = value;
                        });
                      },
                      activeColor: Colors.green,
                      toggleable: true,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            
            // ========== CONTOH 4: Radio dengan Ikon (Mode) ==========
            const Text(
              '4. Mode Aplikasi (Dengan Ikon)',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    RadioListTile(
                      title: const Text('Mode Terang'),
                      secondary: const Icon(Icons.light_mode),
                      value: 'terang',
                      groupValue: _mode,
                      onChanged: (value) {
                        setState(() {
                          _mode = value;
                        });
                      },
                      activeColor: Colors.orange,
                    ),
                    RadioListTile(
                      title: const Text('Mode Gelap'),
                      secondary: const Icon(Icons.dark_mode),
                      value: 'gelap',
                      groupValue: _mode,
                      onChanged: (value) {
                        setState(() {
                          _mode = value;
                        });
                      },
                      activeColor: Colors.orange,
                    ),
                    RadioListTile(
                      title: const Text('Mode Sistem'),
                      secondary: const Icon(Icons.settings),
                      value: 'sistem',
                      groupValue: _mode,
                      onChanged: (value) {
                        setState(() {
                          _mode = value;
                        });
                      },
                      activeColor: Colors.orange,
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 24),
            
            // ========== TOMBOL SUBMIT ==========
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  _showResultDialog(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'TAMPILKAN HASIL',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
  
  // Widget untuk Radio Horizontal
  Widget _buildHorizontalRadio(String ukuran) {
    return Column(
      children: [
        Radio(
          value: ukuran,
          groupValue: _ukuranBaju,
          onChanged: (value) {
            setState(() {
              _ukuranBaju = value;
            });
          },
          activeColor: Colors.blue,
        ),
        Text(ukuran, style: const TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
  
  // Menampilkan dialog hasil pilihan
  void _showResultDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Hasil Pilihan Anda'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildResultItem('Jenis Kelamin', _jenisKelamin ?? 'Belum dipilih'),
            const SizedBox(height: 8),
            _buildResultItem('Ukuran Baju', _ukuranBaju ?? 'Belum dipilih'),
            const SizedBox(height: 8),
            _buildResultItem('Status', _status ?? 'Belum dipilih'),
            const SizedBox(height: 8),
            _buildResultItem('Mode', _mode ?? 'Belum dipilih'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
  
  Widget _buildResultItem(String label, String value) {
    return Row(
      children: [
        Text('$label : ', style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(value, style: const TextStyle(color: Colors.blue)),
      ],
    );
  }
}