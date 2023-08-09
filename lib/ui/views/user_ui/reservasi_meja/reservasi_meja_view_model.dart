import 'dart:async';

import '../../../../app/app.logger.dart';
import '../../../../app/core/custom_base_view_model.dart';

class ReservasiMejaViewModel extends CustomBaseViewModel {
  final log = getLogger('ReservasiMejaViewModel');

  List<String> imagePaths = [
    'assets/reza_gazebo.jpeg',
    'assets/reza_meja_1.jpeg',
    'assets/reza_meja_2.jpeg',
  ];

  Future<void> init() async {
    easyLoading.backPressed = 2;
  }
}
