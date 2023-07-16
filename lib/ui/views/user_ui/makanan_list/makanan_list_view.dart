import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import './makanan_list_view_model.dart';

class MakananListView extends StatelessWidget {
  const MakananListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MakananListViewModel>.reactive(
      viewModelBuilder: () => MakananListViewModel(),
      onViewModelReady: (MakananListViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        MakananListViewModel model,
        Widget? child,
      ) {
        return const Scaffold(
          body: Center(
            child: Text(
              'MakananListView',
            ),
          ),
        );
      },
    );
  }
}
