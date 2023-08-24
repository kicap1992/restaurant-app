import 'dart:async';

import 'package:webview_flutter/webview_flutter.dart';

import '../../../../app/app.locator.dart';
import '../../../../app/app.logger.dart';
import '../../../../app/core/custom_base_view_model.dart';
import '../../../../services/my_socket_io_client.dart';

class ReservasiMejaViewModel extends CustomBaseViewModel {
  final log = getLogger('ReservasiMejaViewModel');
  WebViewController? webViewController;
  final socketIoClient = locator<MySocketIoClient>();

  List<String> imagePaths = [
    'assets/reza_gazebo.jpeg',
    'assets/reza_meja_1.jpeg',
    'assets/reza_meja_2.jpeg',
  ];

  Future<void> init() async {
    globalVar.backPressed = 'exitApp';
    socketIoClient.on('table_admin', (data) {
      log.i('data : $data');
      // getData();
      webViewController!.reload();
    });
  }
}
