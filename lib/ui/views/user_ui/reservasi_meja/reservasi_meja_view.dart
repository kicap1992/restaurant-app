import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import './reservasi_meja_view_model.dart';

class ReservasiMejaView extends StatelessWidget {
  const ReservasiMejaView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ReservasiMejaViewModel>.reactive(
      viewModelBuilder: () => ReservasiMejaViewModel(),
      onViewModelReady: (ReservasiMejaViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        ReservasiMejaViewModel model,
        Widget? child,
      ) {
        return const Scaffold(
          body: Center(
            child: Text(
              'ReservasiMejaView',
            ),
          ),
        );
      },
    );
  }
}
