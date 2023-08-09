import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';
import '../../../../app/app.logger.dart';
import '../../../../app/app.router.dart';
import '../../../../services/global_var.dart';

class UserIndexTrackingViewModel extends IndexTrackingViewModel {
  final log = getLogger('UserIndexTrackingViewModel');
  final navigationService = locator<NavigationService>();
  final globalVar = locator<GlobalVar>();
  // late bool backPressed;
  Future<void> init() async {
    // BackButtonInterceptor.add(myInterceptor);
    // backPressed = easyLoading.backPressed;
    globalVar.backPressed = 'exitApp';
  }

  // bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
  //   // print("BACK BUTTON!"); // Do some stuff.

  //   log.i('myInterceptor : ${easyLoading.backPressed}');

  //   if (easyLoading.backPressed == 2) {
  //     quitApp(null);
  //   }

  //   if (easyLoading.backPressed == 3) {
  //     // easyLoading.backPressed = 2;
  //     // notifyListeners();
  //     // navigationService.back();
  //     easyLoading.backPressed = 2;
  //     return false;
  //   }

  //   if (easyLoading.backPressed == 1) {
  //     // easyLoading.backPressed = 2;
  //     // notifyListeners();
  //     // navigationService.back();
  //     return false;
  //   }

  //   return true;
  // }

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

//   quitApp(BuildContext? context) {
//     easyLoading.backPressed = 0;
//     showDialog(
//       context: context ?? StackedService.navigatorKey!.currentContext!,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Keluar'),
//           content: const Text('Apakah Anda yakin ingin keluar?'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 easyLoading.backPressed = 2;
//                 Navigator.of(context).pop(false);
//               },
//               child: const Text('Batal'),
//             ),
//             TextButton(
//               onPressed: () => Navigator.of(context).pop(true),
//               child: const Text(
//                 'Keluar',
//                 style: TextStyle(color: dangerColor),
//               ),
//             ),
//           ],
//         );
//       },
//     ).then((value) {
//       if (value == true) {
//         SystemNavigator.pop();
//       }
//     });
//     notifyListeners();
//   }
}
