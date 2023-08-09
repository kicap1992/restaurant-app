import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../app/themes/app_colors.dart';
import '../../../../app/themes/app_text.dart';
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
        return WillPopScope(
          onWillPop: () async {
            // model.log.i('onWillPop di akun_user_view.dart');
            if (model.globalVar.backPressed == 'exitApp') {
              model.quitApp(context);
              model.globalVar.backPressed = 'exitApp';
              return false;
            }
            return false;
          },
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                'Akun Saya',
                style: boldTextStyle.copyWith(color: fontGrey, fontSize: 16),
              ),
              // transparent
              backgroundColor: Colors.transparent,
              automaticallyImplyLeading: false,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.logout_outlined,
                    color: fontGrey,
                  ),
                ),
              ],
            ),
            backgroundColor: backgroundColor,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  // create a circle avatar 150x150 that contain the image
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(150),
                      child: Image.network(
                        'https://a.cdn-hotels.com/gdcs/production0/d1513/35c1c89e-408c-4449-9abe-f109068f40c0.jpg?impolicy=fcrop&w=800&h=533&q=medium',
                        height: 150,
                        width: 150,
                        fit: BoxFit.fill,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(Icons.error);
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Text('Nama'),
                      const Expanded(child: SizedBox(width: 10)),
                      Text(
                        'Reza',
                        style: regularTextStyle.copyWith(
                          color: fontGrey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Icon(
                        Icons.arrow_forward_ios,
                        color: fontGrey,
                        size: 15,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const Text('Jenis Kelamin'),
                      const Expanded(child: SizedBox(width: 10)),
                      Text(
                        'Laki-laki',
                        style: regularTextStyle.copyWith(
                          color: fontGrey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Icon(
                        Icons.arrow_forward_ios,
                        color: fontGrey,
                        size: 15,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const Text('Tanggal Lahir'),
                      const Expanded(child: SizedBox(width: 10)),
                      Text(
                        '12-12-1999',
                        style: regularTextStyle.copyWith(
                          color: fontGrey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Icon(
                        Icons.arrow_forward_ios,
                        color: fontGrey,
                        size: 15,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
