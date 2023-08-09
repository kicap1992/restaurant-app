import 'package:flutter/material.dart';
import 'package:reza_app/app/app.router.dart';
import 'package:reza_app/app/themes/app_colors.dart';
import 'package:reza_app/app/themes/app_text.dart';
import 'package:stacked/stacked.dart';

import './meja_detail_view_model.dart';

class MejaDetailView extends StatelessWidget {
  final String mejaId;

  const MejaDetailView({
    Key? key,
    required this.mejaId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MejaDetailViewModel>.reactive(
      viewModelBuilder: () => MejaDetailViewModel(),
      onViewModelReady: (MejaDetailViewModel model) async {
        await model.init(mejaId);
      },
      builder: (
        BuildContext context,
        MejaDetailViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('MejaDetailView',
                style: TextStyle(color: Colors.white)),
            backgroundColor: mainColor,
            leading: IconButton(
              onPressed: () => model.navigationService.popUntil((route) =>
                  route.settings.name == Routes.userIndexTrackingView),
              icon: const Icon(Icons.arrow_back, color: Colors.white),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: model.imgAsset == null
                        ? const Center(child: CircularProgressIndicator())
                        : Image.asset(model.imgAsset!, fit: BoxFit.cover),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  model.namaMeja,
                  style: const TextStyle(
                    fontSize: 20,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                RichText(
                  text: TextSpan(
                    text: 'Status : ',
                    style: regularTextStyle,
                    children: [
                      TextSpan(
                        text: 'Tersedia',
                        style: regularTextStyle.copyWith(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                RichText(
                  text: TextSpan(
                    text: 'Kapasitas : ',
                    style: regularTextStyle,
                    children: [
                      TextSpan(
                        text: 'Maksimal 8 Orang',
                        style: regularTextStyle.copyWith(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                RichText(
                  text: TextSpan(
                    text: 'Lokasi : ',
                    style: regularTextStyle,
                    children: [
                      TextSpan(
                        text: 'Luar Ruangan',
                        style: regularTextStyle.copyWith(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                RichText(
                  text: TextSpan(
                    text: 'Harga : ',
                    style: regularTextStyle,
                    children: [
                      TextSpan(
                        text: 'Rp. 20.000',
                        style: regularTextStyle.copyWith(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {},
            label: const Text('Pesan'),
            icon: const Icon(Icons.add_shopping_cart),
            backgroundColor: mainColor,
          ),
          floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
        );
      },
    );
  }
}
