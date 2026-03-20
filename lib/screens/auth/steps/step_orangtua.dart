import 'package:flutter/material.dart';

class StepDataOrangTua extends StatelessWidget {
  const StepDataOrangTua({super.key});

@override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Data Orang Tua", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),

          TextField(
            decoration: InputDecoration(
              labelText: "Nama Ayah",
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
          const SizedBox(height: 12),

          TextField(
            decoration: InputDecoration(
              labelText: "Pekerjaan Ayah",
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
          const SizedBox(height: 12),

          TextField(
            decoration: InputDecoration(
              labelText: "Nama Ibu",
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
          const SizedBox(height: 12),

          TextField(
            decoration: InputDecoration(
              labelText: "Pekerjaan Ibu",
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
        ],
      ),
    );
  }
}