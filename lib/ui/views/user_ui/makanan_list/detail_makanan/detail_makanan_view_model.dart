import 'package:reza_app/model/makanan_model.dart';

import '../../../../../app/app.logger.dart';
import '../../../../../app/core/custom_base_view_model.dart';

class DetailMakananViewModel extends CustomBaseViewModel {
  final log = getLogger('DetailMakananViewModel');
  MakananModel? makananModel;

  Future<void> init(MakananModel makananModel) async {
    setBusy(true);
    globalVar.backPressed = 'backNormal';
    this.makananModel = makananModel;
    setBusy(false);
  }
}
