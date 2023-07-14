import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../widgets/my_button.dart';
import '../../widgets/my_textformfield.dart';
import './login_user_view_model.dart';

class LoginUserView extends StatelessWidget {
  const LoginUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginUserViewModel>.reactive(
      viewModelBuilder: () => LoginUserViewModel(),
      onViewModelReady: (LoginUserViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        LoginUserViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          body: WillPopScope(
            onWillPop: () async {
              return model.backPressed;
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: model.formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/logo.png',
                          width: 200,
                          height: 200,
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Halaman Login',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        MyTextFormField(
                          maxLength: 13,
                          hintText: 'No. HP',
                          keyboardType: TextInputType.phone,
                          controller: model.noHpController,
                        ),
                        const SizedBox(height: 16),
                        MyTextFormField(
                          hintText: 'Password',
                          obscureText: model.showPassword,
                          controller: model.passwordController,
                          suffixIcon: IconButton(
                            onPressed: () {
                              model.showPassword = !model.showPassword;
                              model.notifyListeners();
                            },
                            icon: Icon(
                              model.showPassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        MyButton(
                          text: 'Login',
                          onPressed: () {
                            model.log.i('Login button pressed');
                            model.login();
                          },
                        ),
                        TextButton(
                          onPressed: () {
                            model.daftar();
                          },
                          child: const Text(
                            'Belum punya akun? Daftar disini',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
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
