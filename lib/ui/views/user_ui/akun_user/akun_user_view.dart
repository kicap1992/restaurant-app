import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import './akun_user_view_model.dart';

class AkunUserView extends StatelessWidget {
  const AkunUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AkunUserViewModel>.reactive(
      viewModelBuilder: () => AkunUserViewModel(),
      onViewModelReady: (AkunUserViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        AkunUserViewModel model,
        Widget? child,
      ) {
        return const Scaffold(
          body: Center(
            child: Text(
              'AkunUserView',
            ),
          ),
        );
      },
    );
  }
}
