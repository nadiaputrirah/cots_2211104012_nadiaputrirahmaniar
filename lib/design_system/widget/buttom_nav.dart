import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:cots_2211104012_nadiaputrirahmaniar/modules/view/MainPage.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigasi berdasarkan index
    switch (index) {
      case 0:
        Get.off(() => MainPage()); // Navigasi ke MainPage
        break;
      // case 1:
      //   Get.to(() => PromoPage());
      //   break;
      // case 2:
      //   Get.to(() => OrderPage());
      //   break;
      // case 3:
      //   Get.to(() => ChatPage());
      //   break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      iconSize: 40,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedLabelStyle: const TextStyle(color: Colors.black),
      unselectedLabelStyle: const TextStyle(color: Colors.black),
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            _selectedIndex == 0
                ? 'assets/icons/Home.svg' // Ikon aktif
                : 'assets/icons/Home.svg', // Ikon tidak aktif
            width: 40,
            height: 40,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            _selectedIndex == 1
                ? 'assets/icons/Promos.svg' // Ikon aktif
                : 'assets/icons/Promos.svg', // Ikon tidak aktif
            width: 40,
            height: 40,
          ),
          label: 'Promos',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            _selectedIndex == 2
                ? 'assets/icons/Orders.svg' // Ikon aktif
                : 'assets/icons/Orders.svg', // Ikon tidak aktif
            width: 40,
            height: 40,
          ),
          label: 'Orders',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            _selectedIndex == 3
                ? 'assets/icons/Chat.svg' // Ikon aktif
                : 'assets/icons/Chat.svg', // Ikon tidak aktif
            width: 40,
            height: 40,
          ),
          label: 'Chat',
        ),
      ],
    );
  }
}