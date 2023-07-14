import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import './input_informasi_diri_view_model.dart';

class InputInformasiDiriView extends StatelessWidget {
  const InputInformasiDiriView({super.key});

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
        return const Scaffold(
          body: Center(
            child: Text(
              'InputInformasiDiriView',
            ),
          ),
        );
      },
    );
  }
}
