import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import './pesanan_list_view_model.dart';

class PesananListView extends StatelessWidget {
  const PesananListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PesananListViewModel>.reactive(
      viewModelBuilder: () => PesananListViewModel(),
      onViewModelReady: (PesananListViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        PesananListViewModel model,
        Widget? child,
      ) {
        return const Scaffold(
          body: Center(
            child: Text(
              'PesananListView',
            ),
          ),
        );
      },
    );
  }
}
