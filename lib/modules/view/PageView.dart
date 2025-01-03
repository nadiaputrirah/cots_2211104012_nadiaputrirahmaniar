import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cots_2211104012_nadiaputrirahmaniar/modules/controller/PageController.dart';
import 'package:cots_2211104012_nadiaputrirahmaniar/design_system/widget/onboardingnavbar.dart';
import 'package:cots_2211104012_nadiaputrirahmaniar/design_system/styles/color.dart';
import 'package:get/get.dart';
import 'package:cots_2211104012_nadiaputrirahmaniar/modules/routes/app_routes.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  final List<Widget> _slides = const [
    OnboardingSlide(
      imagePath: 'assets/images/welcome.png',
      title: "Selamat datang di Gojek!",
      subtitle:
          "Aplikasi yang bikin hidupmu lebih nyaman. Siap bantuin semua kebutuhanmu, kapanpun, dan di manapun.",
    ),
    OnboardingSlide(
      imagePath: 'assets/images/transportasi.png',
      title: "Transportasi & logistik",
      subtitle:
          "Antarin kamu jalan atau ambilin barang lebih gampang tinggal ngeklik doang.",
    ),
    OnboardingSlide(
      imagePath: 'assets/images/belanja.png',
      title: "Pesan makan & belanja",
      subtitle: "Lagi ngidam sesuatu? Gojek beliin gak pakai lama.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        final controller = OnboardingPageController();
        controller.initListener();
        return controller;
      },
      child: Scaffold(
        body: SafeArea(
          child: Consumer<OnboardingPageController>(
            builder: (context, controller, child) {
              return Column(
                children: [
                  OnboardingNavbar(
                    pageController: controller.pageController,
                    slides: _slides,
                    currentIndex: controller.currentIndex,
                  ),
                  const SizedBox(height: 16),
                  // Tombol navigasi
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Get.toNamed(AppRoutes.login);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorCollection.greenGojek,
                            minimumSize: const Size.fromHeight(48),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            "Masuk",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        OutlinedButton(
                          onPressed: () {
                            Get.toNamed(AppRoutes.register);
                          },
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: ColorCollection.greenGojek),
                            minimumSize: const Size.fromHeight(48),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            "Belum ada akun? Daftar dulu",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: ColorCollection.greenGojek,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Footer
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      "Dengan masuk atau mendaftar, kamu menyetujui Ketentuan layanan dan Kebijakan privasi.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        color: ColorCollection.neutral600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class OnboardingSlide extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;

  const OnboardingSlide({
    required this.imagePath,
    required this.title,
    required this.subtitle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(imagePath, height: 200), // Sesuaikan ukuran gambar
        const SizedBox(height: 16),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: ColorCollection.item,
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: ColorCollection.neutral600,
            ),
          ),
        ),
      ],
    );
  }
}
