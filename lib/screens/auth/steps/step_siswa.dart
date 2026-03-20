import 'package:flutter/material.dart';

class StepDataSiswa extends StatelessWidget {
  const StepDataSiswa({super.key});

@override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Data Siswa", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),

          TextField(
            decoration: InputDecoration(
              labelText: "Nama Lengkap",
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
          const SizedBox(height: 12),

          TextField(
            decoration: InputDecoration(
              labelText: "Kelas",
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
          const SizedBox(height: 12),

          TextField(
            decoration: InputDecoration(
              labelText: "Asal Sekolah",
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
          const SizedBox(height: 12),

          TextField(
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              labelText: "No WhatsApp",
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
        ],
      ),
    );
  }
}