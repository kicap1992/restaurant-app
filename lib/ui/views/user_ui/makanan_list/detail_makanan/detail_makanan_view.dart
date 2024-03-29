import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:reza_app/model/makanan_model.dart';
import 'package:stacked/stacked.dart';

import '../../../../../app/themes/app_colors.dart';
import '../../../../../app/themes/app_text.dart';
import '../../../../widgets/my_white_container.dart';
import './detail_makanan_view_model.dart';

class DetailMakananView extends HookWidget {
  final MakananModel makananModel;

  const DetailMakananView({
    Key? key,
    required this.makananModel,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();
    final opacity = useState(0.0);
    final theHeight = useState(MediaQuery.of(useContext()).size.height * 0.35);

    checkScrollValue(scrollController, opacity, theHeight);

    return ViewModelBuilder<DetailMakananViewModel>.reactive(
      viewModelBuilder: () => DetailMakananViewModel(),
      onViewModelReady: (DetailMakananViewModel model) async {
        await model.init(makananModel);
      },
      builder: (
        BuildContext context,
        DetailMakananViewModel model,
        Widget? child,
      ) {
        return WillPopScope(
          onWillPop: () async {
            // model.log.i('onWillPop di reservasi_meja_view.dart');
            // if (model.globalVar.backPressed == 'exitApp') {
            model.globalVar.backPressed = 'exitApp';
            model.back();
            return false;
            // }
            // return false;
          },
          child: Scaffold(
            backgroundColor: backgroundColor,
            body: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  ListView.builder(
                    controller: scrollController,
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).padding.top,
                          ),
                          const TopMenuWidget(),
                          const SecondWidget(),
                          const SizedBox(
                            height: 10,
                          ),
                          MyWhiteContainer(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Ongkos Kirim',
                                          style: boldTextStyle.copyWith(
                                            fontSize: 14,
                                          ),
                                        ),
                                        TextSpan(
                                          text: ' Rp. 10.000',
                                          style: boldTextStyle.copyWith(
                                            fontSize: 14,
                                            color: dangerColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Bisa Dibayar COD sekitar Parepare",
                                    style: regularTextStyle.copyWith(
                                      fontSize: 13,
                                      color: fontGrey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          MyWhiteContainer(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Deskripsi",
                                    style: boldTextStyle.copyWith(
                                      fontSize: 15,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  // bikin dummy text tentang nasi goreng
                                  Text(
                                    model.isBusy
                                        ? 'Loading...'
                                        : model.makananModel!.deskripsiMakanan!,
                                    style: regularTextStyle.copyWith(
                                      fontSize: 13,
                                      color: fontGrey,
                                    ),
                                    textAlign: TextAlign.justify,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      );
                    },
                  ),
                  TopBarWidget(opacity: opacity),
                ],
              ),
            ),
            bottomNavigationBar: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              width: MediaQuery.of(context).size.width,
              height: 70,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 5,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total Harga",
                            style: regularTextStyle.copyWith(
                              fontSize: 14,
                              color: fontGrey,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            model.isBusy
                                ? 'Loading...'
                                : 'Rp. ${int.parse(makananModel.hargaMakanan!) + 10000}',
                            style: boldTextStyle.copyWith(
                              fontSize: 16,
                              color: dangerColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: dangerColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "Pesan Sekarang",
                            style: boldTextStyle.copyWith(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void checkScrollValue(
    ScrollController scrollController,
    ValueNotifier<double> opacity,
    ValueNotifier<double> theHeight,
  ) {
    scrollController.addListener(() {
      opacity.value = scrollController.offset / theHeight.value;
      if (opacity.value > 1) {
        opacity.value = 1;
      } else if (opacity.value < 0) {
        opacity.value = 0;
      }
    });
  }
}

class TopBarWidget extends ViewModelWidget<DetailMakananViewModel> {
  const TopBarWidget({
    super.key,
    required this.opacity,
  });

  final ValueNotifier<double> opacity;

  @override
  Widget build(BuildContext context, DetailMakananViewModel viewModel) {
    return Positioned(
      top: 0,
      child: Container(
        padding: const EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        color: Colors.white.withOpacity(opacity.value),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).padding.top,
            ),
            Row(
              // create 3 circle widget, with background color is black and opacity is 0.5, ist icon is back, second icon is cart and third icon is 3 dots
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: IconButton(
                    onPressed: () {
                      viewModel.globalVar.backPressed = 'exitApp';
                      viewModel.back();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                ),
                const Expanded(
                  child: SizedBox(
                    width: 20,
                  ),
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.more_vert,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SecondWidget extends ViewModelWidget<DetailMakananViewModel> {
  const SecondWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, DetailMakananViewModel viewModel) {
    return MyWhiteContainer(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  viewModel.isBusy
                      ? 'Loading...'
                      : viewModel.makananModel!.namaMakanan!,
                  style: regularTextStyle.copyWith(
                    fontSize: 17,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  viewModel.isBusy
                      ? 'Loading...'
                      : 'Rp .${viewModel.makananModel!.hargaMakanan!}',
                  style: regularTextStyle.copyWith(
                    fontSize: 18,
                    color: dangerColor,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "49 Terjual",
                        style: regularTextStyle.copyWith(
                          fontSize: 14,
                          color: fontGrey,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite_border,
                        color: fontGrey,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TopMenuWidget extends ViewModelWidget<DetailMakananViewModel> {
  const TopMenuWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, DetailMakananViewModel viewModel) {
    return Stack(
      children: [
        SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.35,
            child: viewModel.isBusy
                ? const Center(child: CircularProgressIndicator())
                : Image.network(
                    '${dotenv.env['url']}assets/makanan/${viewModel.makananModel!.imgUrl}',
                    fit: BoxFit.cover,
                  )),
        // Positioned(
        //   bottom: 10,
        //   right: 10,
        //   child: Container(
        //     padding: const EdgeInsets.symmetric(
        //       horizontal: 5,
        //     ),
        //     // width: 20,
        //     height: 20,
        //     decoration: BoxDecoration(
        //       color: Colors.white,
        //       borderRadius: BorderRadius.circular(10),
        //     ),
        //     child: const Center(
        //       child: Text(
        //         '1 / 2',
        //         style: TextStyle(
        //           color: fontGrey,
        //           fontSize: 12,
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
