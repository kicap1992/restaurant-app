import 'package:reza_app/app/core/custom_base_view_model.dart';

import '../../../../../app/app.logger.dart';

class KeranjangSayaViewModel extends CustomBaseViewModel {
  final log = getLogger('KeranjangSayaViewModel');
  Future<void> init() async {
    globalVar.backPressed = 'backNormal';
  }
}
