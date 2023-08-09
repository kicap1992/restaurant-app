import 'package:flutter/material.dart';
import 'package:reza_app/app/app.router.dart';
import 'package:reza_app/ui/widgets/my_button.dart';
import 'package:reza_app/ui/widgets/my_textformfield.dart';
import 'package:stacked/stacked.dart';
import 'package:validatorless/validatorless.dart';

import '../../../../app/themes/app_colors.dart';
import '../../../../app/themes/app_text.dart';
import './input_informasi_diri_view_model.dart';

class InputInformasiDiriView extends StatelessWidget {
  final String noHp;

  const InputInformasiDiriView({Key? key, required this.noHp})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<InputInformasiDiriViewModel>.reactive(
      viewModelBuilder: () => InputInformasiDiriViewModel(),
      onViewModelReady: (InputInformasiDiriViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        InputInformasiDiriViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('INPUT INFORMASI DIRI',
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
                model.navigationService.navigateToMasukanNoHpView();
              }
              return false;
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: SingleChildScrollView(
                child: Form(
                  key: model.formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 25),
                      Center(
                        child: Image.asset(
                          'assets/logo.png',
                          width: 100,
                          height: 100,
                          alignment: Alignment.center,
                        ),
                      ),
                      const SizedBox(height: 15),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '  No . HP',
                        ),
                      ),
                      const SizedBox(height: 5),
                      MyTextFormField(
                        initialValue: noHp,
                        readOnly: true,
                      ),
                      const SizedBox(height: 15),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '  Nama Lengkap',
                        ),
                      ),
                      const SizedBox(height: 5),
                      MyTextFormField(
                        hintText: 'Masukan Nama Lengkap',
                        controller: model.namaLengkapController,
                        validator: Validatorless.required(
                          'Nama Lengkap tidak boleh kosong',
                        ),
                      ),
                      const SizedBox(height: 15),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '  Tanggal Lahir',
                        ),
                      ),
                      const SizedBox(height: 5),
                      MyTextFormField(
                        hintText: 'Pilih Tanggal Lahir',
                        readOnly: true,
                        controller: model.tanggalLahirController,
                        validator: Validatorless.required(
                          'Tanggal Lahir tidak boleh kosong',
                        ),
                        onTap: () => model.selectDate(context),
                      ),
                      const SizedBox(height: 15),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '  Jenis Kelamin',
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 60,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                            color: mainColor,
                          ),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: model.jenisKelamin,
                            onChanged: (String? newValue) {
                              // model.setSelectedJenisKelamin(newValue!);
                              model.log.i(newValue);
                              model.jenisKelamin = newValue!;
                              model.notifyListeners();
                            },
                            items: model.jenisKelaminList.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: regularTextStyle.copyWith(
                                    fontSize: 16,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '  Alamat',
                        ),
                      ),
                      const SizedBox(height: 5),
                      MyTextFormField(
                        hintText: 'Masukan Alamat',
                        maxLines: 3,
                        controller: model.alamatController,
                        validator: Validatorless.required(
                          'Alamat tidak boleh kosong',
                        ),
                      ),
                      const SizedBox(height: 15),
                      MyButton(
                        text: 'Daftar',
                        onPressed: () {
                          if (model.formKey.currentState!.validate()) {
                            model.goToLogin();
                          }
                        },
                      ),
                      const SizedBox(height: 25),
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
