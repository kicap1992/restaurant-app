import 'package:dio/dio.dart';
import 'package:reza_app/model/reservasi_meja_model.dart';

import '../../../app/app.logger.dart';
import '../../../app/core/custom_base_view_model.dart';
import '../../../model/my_model.dart';

class MejaDetailViewModel extends CustomBaseViewModel {
  final log = getLogger('MejaDetailViewModel');

  late String mejaId;
  late String namaMeja;
  late int idMeja;

  String? imgAsset;
  bool theBool = false;
  ReservasiMejaModel? reservasiMejaModel;

  Future<void> init(String mejaId) async {
    // log.i('MejaDetailViewModel init');
    // log.i('mejaId : $mejaId');
    this.mejaId = mejaId;
    globalVar.backPressed = 'backNormal';
    // seperate the number from the string
    var number = int.parse(mejaId.replaceAll(RegExp(r'[^0-9]'), ''));
    // log.i('number : $number');
    if (number <= 4) {
      namaMeja = 'Gazebo';
      imgAsset = 'assets/reza_gazebo.jpeg';
    } else if (number >= 5 && number <= 12) {
      namaMeja = 'Meja';
      imgAsset = 'assets/reza_meja_1.jpeg';
    } else if (number >= 13 && number <= 22) {
      namaMeja = 'Meja';
      imgAsset = 'assets/reza_meja_2.jpeg';
    }
    idMeja = number;

    namaMeja = '$namaMeja $number';

    // log.i('imgAsset : $imgAsset');
    getData();
  }

  getData() async {
    easyLoading.showLoading();
    setBusy(true);
    try {
      var response = await httpService.get('table/detail/$idMeja');
      log.i('response : $response');
      MyModel myModel = MyModel.fromJson(response.data);
      theBool = myModel.theBool!;

      reservasiMejaModel =
          theBool ? ReservasiMejaModel.fromJson(myModel.data) : null;

      log.i('reservasiMejaModel : $reservasiMejaModel');
    } catch (e) {
      log.e('error : $e');
    } finally {
      setBusy(false);
      easyLoading.dismissLoading();
    }
  }

  showReservasiMeja() async {
    await dialogService
        .showDialog(
      title: 'Reservasi Meja',
      description: 'Apakah anda ingin reservasi meja ini?',
      buttonTitle: 'Ya',
      cancelTitle: 'Tidak',
    )
        .then((value) {
      log.i('value : $value');
      if (value!.confirmed) {
        reservasiMeja();
        log.i('confirmed');
      } else {
        log.i('not confirmed');
      }
    });
  }

  reservasiMeja() async {
    easyLoading.customLoading('Melakukan reservasi meja...');
    setBusy(true);
    try {
      var formData = FormData.fromMap({'id_user': 1, 'status': 'booking'});

      String path = 'table/reservation/$idMeja';

      await httpService.postWithFormData(path, formData);
      // log.i('res : $res');
      getData();
      snackbarService.showSnackbar(
        message:
            'Reservasi meja berhasil\nSila Bayar Rp. 20 ribu jika tiba di cafe',
        title: 'Berhasil',
        duration: const Duration(seconds: 2),
      );
    } catch (e) {
      log.e('error : $e');
    } finally {
      setBusy(false);
      easyLoading.dismissLoading();
    }
  }
}
