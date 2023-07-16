import 'package:flutter/material.dart';
import '../../../app/app.router.dart';

import '../../../app/app.logger.dart';
import '../../../app/core/custom_base_view_model.dart';

class LoginUserViewModel extends CustomBaseViewModel {
  final log = getLogger('LoginUserViewModel');

  TextEditingController noHpController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool showPassword = true;

  Future<void> init() async {}

  login() async {
    setBusy(true);
    backPressed = false;
    easyLoading.showLoading();
    await Future.delayed(const Duration(seconds: 2));
    easyLoading.dismissLoading();
    setBusy(false);
    backPressed = true;
    notifyListeners();
    await navigationService.navigateToUserIndexTrackingView();
  }

  daftar() async {
    await navigationService.navigateToMasukanNoHpView();
  }
}
