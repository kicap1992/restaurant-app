import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

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
        return const Scaffold(
          body: Center(
            child: Text(
              'VerifikasiNoHpView',
            ),
          ),
        );
      },
    );
  }
}
