import 'package:flutter/material.dart';

class Pertemuan8 extends StatefulWidget {
  const Pertemuan8({super.key});

  @override
  State<Pertemuan8> createState() => _Pertemuan8State();
}

class _Pertemuan8State extends State<Pertemuan8> {
  // 1. Data untuk Autocomplete
  final List<String> _universities = [
    'Universitas Pamulang',
    'Universitas Indonesia',
    'Institut Teknologi Bandung',
    'Universitas Gadjah Mada',
    'Universitas Bina Nusantara',
  ];

  final List<String> _majors = [
    'Sistem Informasi',
    'Teknik Informatika',
    'Manajemen',
    'Akuntansi',
    'Hukum',
  ];

  // 2. Data untuk Spinner (Dropdown)
  final List<String> _educationLevels = ['SMA/Sederajat', 'D3', 'S1', 'S2', 'S3'];
  final List<String> _years = ['2021', '2022', '2023', '2024', '2025'];

  // 3. Variabel Penampung
  String? _selectedLevel;
  String? _selectedYear;
  final TextEditingController _uniController = TextEditingController();
  final TextEditingController _majorController = TextEditingController();

  // Fungsi untuk menampilkan Dialog Berhasil (seperti di gambar)
  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.check_circle, color: Colors.green, size: 60),
              const SizedBox(height: 15),
              const Text("Berhasil!", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              const Text("Data mahasiswa berhasil disimpan:"),
              const Divider(),
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("🎓 Univ: ${_uniController.text}"),
                    Text("📘 Jurusan: ${_majorController.text}"),
                    Text("📊 Jenjang: ${_selectedLevel ?? '-'}"),
                    Text("📅 Tahun: ${_selectedYear ?? '-'}"),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: () => Navigator.pop(context),
                child: const Text("OK", style: TextStyle(color: Colors.white)),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Form dengan AutoComplete dan Spinner"),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Informasi Mahasiswa",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.deepPurple),
                ),
                const Divider(),
                const SizedBox(height: 10),

                // AUTOCOMPLETE UNIVERSITAS
                const Text("Universitas", style: TextStyle(fontWeight: FontWeight.bold)),
                Autocomplete<String>(
                  optionsBuilder: (TextEditingValue textEditingValue) {
                    return _universities.where((String option) {
                      return option.toLowerCase().contains(textEditingValue.text.toLowerCase());
                    });
                  },
                  onSelected: (String selection) => _uniController.text = selection,
                  fieldViewBuilder: (context, controller, focusNode, onFieldSubmitted) {
                    return TextField(
                      controller: controller,
                      focusNode: focusNode,
                      decoration: const InputDecoration(
                        hintText: "Cari Universitas...",
                        prefixIcon: Icon(Icons.school),
                      ),
                    );
                  },
                ),

                const SizedBox(height: 20),

                // AUTOCOMPLETE JURUSAN
                const Text("Jurusan", style: TextStyle(fontWeight: FontWeight.bold)),
                Autocomplete<String>(
                  optionsBuilder: (TextEditingValue textEditingValue) {
                    return _majors.where((String option) {
                      return option.toLowerCase().contains(textEditingValue.text.toLowerCase());
                    });
                  },
                  onSelected: (String selection) => _majorController.text = selection,
                  fieldViewBuilder: (context, controller, focusNode, onFieldSubmitted) {
                    return TextField(
                      controller: controller,
                      focusNode: focusNode,
                      decoration: const InputDecoration(
                        hintText: "Cari Jurusan...",
                        prefixIcon: Icon(Icons.book),
                      ),
                    );
                  },
                ),

                const SizedBox(height: 20),

                // SPINNER/DROPDOWN JENJANG
                const Text("Jenjang Pendidikan", style: TextStyle(fontWeight: FontWeight.bold)),
                DropdownButtonFormField<String>(
                  value: _selectedLevel,
                  hint: const Text("Pilih Jenjang"),
                  items: _educationLevels.map((String level) {
                    return DropdownMenuItem(value: level, child: Text(level));
                  }).toList(),
                  onChanged: (value) => setState(() => _selectedLevel = value),
                ),

                const SizedBox(height: 20),

                // SPINNER/DROPDOWN TAHUN
                const Text("Tahun Masuk", style: TextStyle(fontWeight: FontWeight.bold)),
                DropdownButtonFormField<String>(
                  value: _selectedYear,
                  hint: const Text("Pilih tahun masuk"),
                  items: _years.map((String year) {
                    return DropdownMenuItem(value: year, child: Text(year));
                  }).toList(),
                  onChanged: (value) => setState(() => _selectedYear = value),
                ),

                const SizedBox(height: 30),

                // TOMBOL SIMPAN
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: _showSuccessDialog,
                    child: const Text("Simpan Data", style: TextStyle(color: Colors.white, fontSize: 16)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}