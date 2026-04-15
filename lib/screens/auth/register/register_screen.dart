import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bmc_app/theme/app_theme.dart';
import 'package:bmc_app/widgets/primary_button.dart';
import '../steps/step_siswa.dart';
import '../steps/step_orangtua.dart';
import '../steps/step_persetujuan.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  int _currentStep = 0;
  final PageController _pageController = PageController();
  bool _isLoading = false;

  final List<_StepInfo> _steps = const [
    _StepInfo(
      title: 'Data Siswa',
      subtitle: 'Isi data diri calon siswa',
    ),
    _StepInfo(
      title: 'Data Orang Tua',
      subtitle: 'Isi data ayah & ibu siswa',
    ),
    _StepInfo(
      title: 'Persetujuan & Akun',
      subtitle: 'Tanda tangan & buat akun login',
    ),
  ];

  void _nextStep() {
    if (_currentStep < _steps.length - 1) {
      setState(() => _currentStep++);
      _pageController.animateToPage(
        _currentStep,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    } else {
      _submitForm();
    }
  }

  void _prevStep() {
    if (_currentStep > 0) {
      setState(() => _currentStep--);
      _pageController.animateToPage(
        _currentStep,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    }
  }

  void _submitForm() async {
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(seconds: 2));
    setState(() => _isLoading = false);
    if (mounted) {
      _showSuccessDialog();
    }
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: const BoxDecoration(
                color: AppColors.primaryLight,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check_circle_outline_rounded,
                color: AppColors.primary,
                size: 40,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Pendaftaran Berhasil!',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColors.textDark,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Pendaftaran Anda telah berhasil disimpan. Silakan tunggu konfirmasi dari pihak Bimbel.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                color: AppColors.textGrey,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Selesai & Login',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          _buildHeader(),
          Expanded(
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                StepDataSiswa(),
                StepDataOrangTua(),
                StepPersetujuanLogin(),
              ],
            ),
          ),
          _buildBottomNav(),
        ],
      ),
    );
  }

Widget _buildHeader() {
  return Container(
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        colors: [AppColors.primary, AppColors.primaryDark],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
    child: SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔥 ROW HEADER (BACK + TITLE + STEP)
            Row(
              children: [

                // 🔥 BACK BUTTON (SEKARANG SELALU ADA)
                GestureDetector(
                  onTap: () {
                    if (_currentStep > 0) {
                      _prevStep(); // 🧠 balik ke step sebelumnya
                    } else {
                      Navigator.pop(context); // 🧠 keluar ke GetStarted
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.arrow_back_rounded,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ),

                const SizedBox(width: 12),

                // 🔥 TITLE + SUBTITLE
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Registrasi Siswa Baru',
                        style: AppTextStyles.heading,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        _steps[_currentStep].subtitle,
                        style: AppTextStyles.subHeading,
                      ),
                    ],
                  ),
                ),

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '${_currentStep + 1} / ${_steps.length}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // 🔥 PROGRESS STEP (GARIS BAWAH)
            Row(
              children: List.generate(_steps.length, (i) {
                return Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                        right: i < _steps.length - 1 ? 6 : 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _steps[i].title,
                          style: TextStyle(
                            fontSize: 9,
                            color: i <= _currentStep
                                ? Colors.white
                                : Colors.white.withValues(alpha: 0.5),
                            fontWeight: i == _currentStep
                                ? FontWeight.w600
                                : FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 4),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          height: 4,
                          decoration: BoxDecoration(
                            color: i <= _currentStep
                                ? Colors.white
                                : Colors.white.withValues(alpha: 0.3),
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    ),
  );
}

  Widget _buildBottomNav() {
    final isLast = _currentStep == _steps.length - 1;
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 28),
      decoration: const BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x12000000),
            blurRadius: 12,
            offset: Offset(0, -4),
          ),
        ],
      ),
      child: PrimaryButton(
        text: isLast ? 'Lanjut ke Menu Utama' : 'Lanjut',
        onPressed: _nextStep,
        isLoading: _isLoading,
      ),
    );
  }
}

class _StepInfo {
  final String title;
  final String subtitle;
  const _StepInfo({required this.title, required this.subtitle});
}