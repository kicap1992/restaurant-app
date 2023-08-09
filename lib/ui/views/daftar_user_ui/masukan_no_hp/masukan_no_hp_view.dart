import 'package:flutter/material.dart';
import '../../../../app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:validatorless/validatorless.dart';

import '../../../../app/themes/app_colors.dart';
import '../../../widgets/my_button.dart';
import '../../../widgets/my_textformfield.dart';
import './masukan_no_hp_view_model.dart';

class MasukanNoHpView extends StatelessWidget {
  const MasukanNoHpView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MasukanNoHpViewModel>.reactive(
      viewModelBuilder: () => MasukanNoHpViewModel(),
      onViewModelReady: (MasukanNoHpViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        MasukanNoHpViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('PENDAFTARAN USER BARU',
                style: TextStyle(
                  color: lightColor,
                )),
            backgroundColor: mainColor,
            iconTheme: const IconThemeData(
                color:
                    Colors.white), // Set the color of the back button to white
          ),
          body: WillPopScope(
            onWillPop: () async {
              if (model.globalVar.backPressed == 'backNormal') {
                model.navigationService.navigateToLoginUserView();
              }
              return false;
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Center(
                child: Form(
                  key: model.formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/logo.png',
                        width: 100,
                        height: 100,
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        'Masukkan Nomor HP',
                      ),
                      const SizedBox(height: 16),
                      MyTextFormField(
                        maxLength: 13,
                        hintText: 'No. HP',
                        keyboardType: TextInputType.phone,
                        controller: model.noHpController,
                        validator:
                            Validatorless.required('No. HP tidak boleh kosong'),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: MyButton(
                          text: 'Selanjutnya',
                          onPressed: () {
                            // if noHpController length is less than 9, return
                            if (model.noHpController.text.length < 9) {
                              model.snackbarService.showSnackbar(
                                  message: 'No. HP tidak boleh kurang dari 9');
                              return;
                            }

                            if (!model.formKey.currentState!.validate()) {
                              return;
                            }
                            FocusScope.of(context).unfocus();
                            model.log.i('Selanjutnya button pressed');
                            model.selanjutnya();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
