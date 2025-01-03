import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Pastikan Anda menambahkan dependensi flutter_svg di pubspec.yaml
import 'package:cots_2211104012_nadiaputrirahmaniar/design_system/styles/color.dart';

class OnboardingNavbar extends StatelessWidget {
  final PageController pageController;
  final List<Widget> slides;
  final int currentIndex;

  const OnboardingNavbar({
    Key? key,
    required this.pageController,
    required this.slides,
    required this.currentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          // Bagian navigasi
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Logo Gojek di kiri
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SvgPicture.asset(
                  'assets/icons/Gojek.svg', // Path file SVG
                ),
              ),
              // Logo Language di kanan
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SvgPicture.asset(
                  'assets/icons/Language.svg', // Path file SVG
                ),
              ),
            ],
          ),
          // Bagian PageView dan Indicator
          Column(
            children: [
              Expanded(
                flex: 3,
                child: PageView(
                  controller: pageController,
                  children: slides,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  slides.length,
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: index == currentIndex
                          ? ColorCollection.greenGojek
                          : ColorCollection.neutral500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}