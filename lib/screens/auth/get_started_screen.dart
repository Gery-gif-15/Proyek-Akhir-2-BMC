import 'package:flutter/material.dart';
import 'login/login_screen.dart';
import 'register/register_screen.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            /// Logo
            Image.asset(
              "assets/logo_bmc.jpeg",
              width: 120,
            ),

            const SizedBox(height: 30),

            /// Judul
            const Text(
              "Masuk atau\nDaftar di BMC",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            /// Deskripsi
            const Text(
              "Platform bimbingan belajar terpercaya untuk meraih prestasi terbaik.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 30),

            /// Info box
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.orange),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                "Buat akun dulu untuk bisa melihat paket bimbel dan melakukan pembayaran",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13),
              ),
            ),

            const SizedBox(height: 25),

            /// Button Buat Akun
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                onPressed: () {

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegistrationScreen(),
                    ),
                  );

                },
                child: const Text("Buat Akun Baru"),
              ),
            ),

            const SizedBox(height: 15),

            /// Button Login
            SizedBox(
              width: double.infinity,
              height: 50,
              child: OutlinedButton(
                onPressed: () {

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );

                },
                child: const Text("Sudah Punya Akun"),
              ),
            ),

            const SizedBox(height: 20),

            /// Link paket
            TextButton(
              onPressed: () {},
              child: const Text("Lihat Paket Les"),
            ),

            const Spacer(),

            const Text(
              "© 2026 Bimbel Bintang Muda Center",
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            )

          ],
        ),
      ),
    );
  }
}