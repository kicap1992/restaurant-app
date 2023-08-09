import 'package:flutter/material.dart';

import '../../../../app/app.router.dart';
import '../../../../app/app.logger.dart';
import '../../../../app/core/custom_base_view_model.dart';

class InputInformasiDiriViewModel extends CustomBaseViewModel {
  final log = getLogger('InputInformasiDiriViewModel');
  Future<void> init() async {}

  List<String> jenisKelaminList = ['Laki-laki', 'Perempuan'];
  String jenisKelamin = 'Laki-laki';

  TextEditingController namaLengkapController = TextEditingController();
  TextEditingController tanggalLahirController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  selectDate(BuildContext context) async {
    // get today's date
    var datePicked = await showDatePicker(
      context: context,
      initialDate: DateTime(2013),
      firstDate: DateTime(1950),
      // last date is today's date
      lastDate: DateTime(2013),
    );

    if (datePicked != null) {
      String date = datePicked.toString().split(' ')[0];
      tanggalLahirController.text = date;
    }
  }

  goToLogin() async {
    globalVar.backPressed = 'cantBack';
    easyLoading.customLoading("Mendaftarkan Akun Anda");
    await Future.delayed(const Duration(seconds: 2));
    easyLoading.customLoading("Ke Halaman Login");
    await Future.delayed(const Duration(seconds: 2));
    easyLoading.dismissLoading();
    globalVar.backPressed = 'backNormal';
    notifyListeners();
    await navigationService.navigateToLoginUserView();
  }
}
