import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';
import '../../../../app/app.logger.dart';
import '../../../../app/app.router.dart';
import '../../../../app/themes/app_colors.dart';

class UserIndexTrackingViewModel extends IndexTrackingViewModel {
  final log = getLogger('UserIndexTrackingViewModel');
  final navigationService = locator<NavigationService>();
  bool backPressed = true;
  Future<void> init() async {
    BackButtonInterceptor.add(myInterceptor);
  }

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    // print("BACK BUTTON!"); // Do some stuff.

    if (backPressed) {
      quitApp(null);
    }

    return true;
  }

  final _bottomNavBarList = [
    {
      'name': 'Meja',
      'icon': Icons.table_restaurant_outlined,
      'header': 'RESERVASI MEJA',
    },
    {
      'name': 'Makanan',
      'icon': Icons.food_bank_outlined,
      'header': 'LIST MAKANAN',
    },
    {
      'name': 'Pesanan',
      'icon': Icons.shopping_cart_outlined,
      'header': 'LIST PESANAN',
    },
    {
      'name': 'Akun',
      'icon': Icons.person_outline,
      'header': 'AKUN',
    },
  ];
  String header = 'RESERVASI MEJA';

  List<Map<String, dynamic>> get bottomNavBarList => _bottomNavBarList;

  final List<String> _views = [
    UserIndexTrackingViewRoutes.reservasiMejaView,
    UserIndexTrackingViewRoutes.makananListView,
    UserIndexTrackingViewRoutes.pesananListView,
    UserIndexTrackingViewRoutes.akunUserView,
  ];

  void handleNavigation(int index) {
    // log.d("handleNavigation: $index");
    // log.d("currentIndex: $currentIndex");

    if (currentIndex == index) return;

    setIndex(index);
    header = _bottomNavBarList[index]['header'] as String;
    navigationService.navigateTo(
      _views[index],
      id: 3,
    );
  }

  quitApp(BuildContext? context) {
    backPressed = false;
    showDialog(
      context: context ?? StackedService.navigatorKey!.currentContext!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Keluar'),
          content: const Text('Apakah Anda yakin ingin keluar?'),
          actions: [
            TextButton(
              onPressed: () {
                backPressed = true;
                Navigator.of(context).pop(false);
              },
              child: const Text('Batal'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text(
                'Keluar',
                style: TextStyle(color: dangerColor),
              ),
            ),
          ],
        );
      },
    ).then((value) {
      if (value == true) {
        SystemNavigator.pop();
      }
    });
    notifyListeners();
  }
}
