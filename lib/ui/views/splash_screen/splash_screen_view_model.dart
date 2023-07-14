import 'package:reza_app/app/app.router.dart';
import 'package:reza_app/app/core/custom_base_view_model.dart';

class SplashScreenViewModel extends CustomBaseViewModel {
  Future<void> init() async {
    // after 2 second, navigate to login page
    await Future.delayed(const Duration(seconds: 2));
    await navigationService.navigateToLoginUserView();
  }
}
