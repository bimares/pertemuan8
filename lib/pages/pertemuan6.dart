import 'package:flutter/material.dart';

class Pertemuan6Page extends StatefulWidget {
  const Pertemuan6Page({super.key});

  @override
  State<Pertemuan6Page> createState() => _Pertemuan6PageState();
}

class _Pertemuan6PageState extends State<Pertemuan6Page> {
  // 1. CheckBox Dasar (boolean)
  bool _isChecked = false;
  
  // 2. CheckBoxListTile (untuk hobi)
  Map<String, bool> _hobbies = {
    'Membaca': false,
    'Olahraga': false,
    'Musik': false,
    'Game': false,
    'Traveling': false,
  };
  
  // 3. Tri-State Checkbox (null, true, false)
  bool? _triStateValue = false;
  
  // Untuk menampilkan hasil
  String _hasilPilihan = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pertemuan 6: CheckBox'),
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
              'Contoh Penggunaan CheckBox',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'CheckBox digunakan untuk memilih SATU atau LEBIH opsi dari beberapa pilihan',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const Divider(height: 32),
            
            // ========== CONTOH 1: CheckBox Dasar ==========
            const Text(
              '1. CheckBox Dasar',
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
                  children: [
                    Checkbox(
                      value: _isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          _isChecked = value ?? false;
                        });
                      },
                      activeColor: Colors.blue,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      'Saya menyetujui syarat dan ketentuan',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        decoration: _isChecked 
                            ? TextDecoration.none 
                            : TextDecoration.none,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            
            // ========== CONTOH 2: CheckBoxListTile (Hobi) ==========
            const Text(
              '2. Pilih Hobi (CheckBoxListTile)',
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
                  children: _hobbies.keys.map((hobby) {
                    return CheckboxListTile(
                      title: Text(
                        hobby,
                        style: const TextStyle(fontSize: 16),
                      ),
                      subtitle: Text('Pilih jika ${hobby} adalah hobi Anda'),
                      value: _hobbies[hobby],
                      onChanged: (bool? value) {
                        setState(() {
                          _hobbies[hobby] = value ?? false;
                        });
                      },
                      secondary: Icon(
                        _getHobbyIcon(hobby),
                        color: Colors.blue,
                      ),
                      activeColor: Colors.blue,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                    );
                  }).toList(),
                ),
              ),
            ),
            const SizedBox(height: 24),
            
            // ========== CONTOH 3: Tri-State Checkbox ==========
            const Text(
              '3. Tri-State Checkbox (3 kondisi)',
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
                child: Column(
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: _triStateValue,
                          onChanged: (bool? value) {
                            setState(() {
                              _triStateValue = value;
                            });
                          },
                          activeColor: Colors.blue,
                          tristate: true, // Aktifkan tri-state
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Pengaturan Notifikasi',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                _getTriStateText(),
                                style: TextStyle(
                                  color: _getTriStateColor(),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        'Tri-State memiliki 3 kondisi:\n• true (dicentang)\n• false (tidak dicentang)\n• null (tidak pasti/sebagian)',
                        style: TextStyle(fontSize: 12),
                      ),
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
  
  // Mendapatkan icon untuk setiap hobi
  IconData _getHobbyIcon(String hobby) {
    switch (hobby) {
      case 'Membaca':
        return Icons.menu_book;
      case 'Olahraga':
        return Icons.sports_soccer;
      case 'Musik':
        return Icons.music_note;
      case 'Game':
        return Icons.sports_esports;
      case 'Traveling':
        return Icons.flight;
      default:
        return Icons.favorite;
    }
  }
  
  // Mendapatkan teks berdasarkan nilai tri-state
  String _getTriStateText() {
    if (_triStateValue == true) {
      return 'Aktif: Semua notifikasi akan diterima';
    } else if (_triStateValue == false) {
      return 'Nonaktif: Tidak ada notifikasi';
    } else {
      return 'Sebagian: Notifikasi penting saja';
    }
  }
  
  // Mendapatkan warna berdasarkan nilai tri-state
  Color _getTriStateColor() {
    if (_triStateValue == true) {
      return Colors.green;
    } else if (_triStateValue == false) {
      return Colors.red;
    } else {
      return Colors.orange;
    }
  }
  
  // Menampilkan dialog hasil pilihan
  void _showResultDialog(BuildContext context) {
    // Mendapatkan hobi yang dipilih
    List<String> selectedHobbies = _hobbies.keys
        .where((hobby) => _hobbies[hobby] == true)
        .toList();
    
    String hobbyText = selectedHobbies.isEmpty 
        ? 'Tidak ada hobi dipilih' 
        : selectedHobbies.join(', ');
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Hasil Pilihan Anda'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildResultItem('Persetujuan', _isChecked ? 'Disetujui ✅' : 'Tidak disetujui ❌'),
            const SizedBox(height: 8),
            _buildResultItem('Hobi Dipilih', hobbyText),
            const SizedBox(height: 8),
            _buildResultItem('Status Notifikasi', _getTriStateText()),
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$label : ', style: const TextStyle(fontWeight: FontWeight.bold)),
        Expanded(child: Text(value)),
      ],
    );
  }
}