import 'package:get/get.dart';
import 'package:cots_2211104012_nadiaputrirahmaniar/modules/view/LoginPage.dart';
import 'package:cots_2211104012_nadiaputrirahmaniar/modules/view/PageView.dart';
import 'package:cots_2211104012_nadiaputrirahmaniar/modules/view/MainPage.dart';

class AppRoutes {
  static const String onboarding = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String main = '/main';

  static final routes = [
    GetPage(
      name: onboarding,
      page: () => const OnboardingPage(),
    ),
    GetPage(
      name: login,
      page: () => LoginPage(),
    ),
    GetPage(
      name: AppRoutes.main, // Gunakan rute dari AppRoutes
      page: () =>
          const MainPage(), // Pastikan MainPage diinisialisasi dengan benar
    ),
  ];
}
