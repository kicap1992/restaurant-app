import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:stacked/stacked.dart';

import '../../../../app/themes/app_colors.dart';
import './verifikasi_no_hp_view_model.dart';

class VerifikasiNoHpView extends StatelessWidget {
  const VerifikasiNoHpView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<VerifikasiNoHpViewModel>.reactive(
      viewModelBuilder: () => VerifikasiNoHpViewModel(),
      onViewModelReady: (VerifikasiNoHpViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        VerifikasiNoHpViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Verifikasi No. HP',
              style: TextStyle(
                color: lightColor,
              ),
            ),
            backgroundColor: mainColor,
            iconTheme: const IconThemeData(
                color:
                    Colors.white), // Set the color of the back button to white
          ),
          body: WillPopScope(
            onWillPop: () async {
              if (model.globalVar.backPressed == 'backNormal') {
                model.back();
              }
              return false;
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/logo.png',
                      width: 75,
                      height: 75,
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'Masukkan Kode OTP yang telah \ndikirimkan ke nomor HP anda',
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 5),
                    OTPTextField(
                      length: 6,
                      width: MediaQuery.of(context).size.width,
                      fieldWidth: 50,
                      style: const TextStyle(fontSize: 17),
                      textFieldAlignment: MainAxisAlignment.spaceAround,
                      fieldStyle: FieldStyle.box,
                      onCompleted: (pin) {
                        model.log.i('Completed: $pin');
                        model.noOTP = int.parse(pin);
                        model.notifyListeners();
                      },
                      onChanged: (value) {
                        model.log.i('onChanged: $value');
                        model.noOTP = int.parse(value);
                        model.notifyListeners();
                      },
                    ),
                    const SizedBox(height: 5),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'Kode OTP kadaluarsa dalam ',
                        style: const TextStyle(color: Colors.black),
                        children: [
                          const TextSpan(
                            text: '00:30\n',
                            style: TextStyle(color: mainColor),
                          ),
                          WidgetSpan(
                            child: GestureDetector(
                              onTap: () {
                                // Handle tap
                              },
                              child: const Center(
                                child: Text(
                                  'Kirim ulang kode OTP',
                                  style: TextStyle(
                                    color: mainColor,
                                    fontSize: 14,
                                    height: 1.5,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: ElevatedButton(
                        onPressed: () {
                          if (model.noOTP == null) {
                            model.snackbarService.showSnackbar(
                                message: 'Kode OTP tidak boleh kosong');
                            return;
                          }

                          // check the length of noOTP
                          if (model.noOTP.toString().length < 6) {
                            model.snackbarService.showSnackbar(
                                message: 'Kode OTP tidak boleh kurang dari 6');
                            return;
                          }
                          // hide the keyboard
                          FocusScope.of(context).unfocus();

                          model.log.i('noOTP: ${model.noOTP}');
                          model.goToInputInformasiDiri();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: mainColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text('Verifikasi'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
