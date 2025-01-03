import 'package:flutter/material.dart';

class OnboardingPageController with ChangeNotifier {
  final PageController pageController = PageController();
  int currentIndex = 0;

  // Ganti nama metode ini agar tidak konflik
  void initListener() {
    pageController.addListener(() {
      currentIndex = pageController.page?.round() ?? 0;
      notifyListeners(); // Memberitahukan perubahan
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}