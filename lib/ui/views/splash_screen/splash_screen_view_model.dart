import 'package:reza_app/app/app.router.dart';
import 'package:reza_app/app/core/custom_base_view_model.dart';

import '../../../app/app.locator.dart';
import '../../../services/my_socket_io_client.dart';

class SplashScreenViewModel extends CustomBaseViewModel {
  final socketIoClient = locator<MySocketIoClient>();
  Future<void> init() async {
    // after 2 second, navigate to login page
    socketIoClient.init();
    await Future.delayed(const Duration(seconds: 2));
    await navigationService.navigateToLoginUserView();
  }
}
