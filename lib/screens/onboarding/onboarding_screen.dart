import 'package:flutter/material.dart';
import '../auth/get_started_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

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

            const SizedBox(height: 40),

            /// Judul
            const Text(
              "Selamat Datang\ndi Bimbel BMC",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            /// Deskripsi
            const Text(
              "Belajar lebih mudah, seru, dan terarah bersama guru terbaik. Raih prestasi impianmu mulai sekarang!",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 40),

            /// Tombol lanjut
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GetStartedScreen(),
                    ),
                  );

                },
                child: const Text("Lanjut"),
              ),
            )

          ],
        ),
      ),
    );
  }
}