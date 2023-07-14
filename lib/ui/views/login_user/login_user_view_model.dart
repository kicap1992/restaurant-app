import 'package:flutter/material.dart';
import '../../../app/app.router.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.logger.dart';
import '../../../app/core/custom_base_view_model.dart';
import '../../../services/my_easyloading.dart';

class LoginUserViewModel extends CustomBaseViewModel {
  final log = getLogger('LoginUserViewModel');
  final easyloading = locator<MyEasyLoading>();

  TextEditingController noHpController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool showPassword = true;

  Future<void> init() async {}

  login() async {
    setBusy(true);
    backPressed = false;
    easyloading.showLoading();
    await Future.delayed(const Duration(seconds: 5));
    easyloading.dismissLoading();
    setBusy(false);
    backPressed = true;
    notifyListeners();
    // await navigationService.navigateToHomeView();
  }

  daftar() async {
    await navigationService.navigateToMasukanNoHpView();
  }
}
