import 'package:flutter/material.dart';

class StepPersetujuanLogin extends StatefulWidget {
  const StepPersetujuanLogin({super.key});

  @override
  State<StepPersetujuanLogin> createState() => _StepPersetujuanLoginState();
}

class _StepPersetujuanLoginState extends State<StepPersetujuanLogin> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Persetujuan", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),

        Row(
          children: [
            Checkbox(
              value: isChecked,
              onChanged: (value) {
                setState(() {
                  isChecked = value!;
                });
              },
            ),
            const Expanded(
              child: Text("Saya menyetujui syarat dan ketentuan"),
            ),
          ],
        ),

        const SizedBox(height: 20),

        TextField(
          decoration: InputDecoration(
            labelText: "Email",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
        const SizedBox(height: 12),

        TextField(
          obscureText: true,
          decoration: InputDecoration(
            labelText: "Password",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ],
    );
  }
}