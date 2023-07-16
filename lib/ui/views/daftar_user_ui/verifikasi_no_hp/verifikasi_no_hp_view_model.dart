import '../../../../app/app.logger.dart';
import '../../../../app/app.router.dart';
import '../../../../app/core/custom_base_view_model.dart';

class VerifikasiNoHpViewModel extends CustomBaseViewModel {
  final log = getLogger('VerifikasiNoHpViewModel');
  int? noOTP;

  Future<void> init() async {}

  goToInputInformasiDiri() async {
    backPressed = false;
    easyLoading.customLoading("Ke Halaman Input Informasi Diri");
    await Future.delayed(const Duration(seconds: 3));
    easyLoading.dismissLoading();
    backPressed = true;
    notifyListeners();
    await navigationService.navigateToInputInformasiDiriView(
      noHp: "082293246583",
    );
  }
}
