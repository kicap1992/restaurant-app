import 'package:flutter/material.dart';
import '../../../../app/app.locator.dart';
import '../../../../app/app.router.dart';

import '../../../../app/app.logger.dart';
import '../../../../app/core/custom_base_view_model.dart';
import '../../../../services/my_easyloading.dart';

class MasukanNoHpViewModel extends CustomBaseViewModel {
  final log = getLogger('MasukanNoHpViewModel');
  final _easyloading = locator<MyEasyLoading>();

  TextEditingController noHpController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Future<void> init() async {}

  selanjutnya() async {
    _easyloading.customLoading("Menghantar Kode OTP \nke WhatsApp Anda");
    globalVar.backPressed = 'cantBack';
    await Future.delayed(const Duration(seconds: 3));
    globalVar.backPressed = 'backNormal';
    notifyListeners();
    _easyloading.dismissLoading();
    await navigationService.navigateToVerifikasiNoHpView();
  }
}
