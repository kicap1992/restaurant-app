import 'package:flutter/material.dart';
import 'package:reza_app/app/app.router.dart';
import 'package:reza_app/app/themes/app_colors.dart';
import 'package:reza_app/app/themes/app_text.dart';
import 'package:reza_app/ui/widgets/my_white_container.dart';
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
        return WillPopScope(
          onWillPop: () async {
            // model.log.i('onWillPop di reservasi_meja_view.dart');
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
                'List Pesanan',
                style: boldTextStyle.copyWith(color: Colors.white),
              ),
              backgroundColor: mainColor,
              automaticallyImplyLeading: false,
              actions: [
                // create a shopping cart icon with a badge containing the number of items
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  child: Stack(
                    children: [
                      IconButton(
                        onPressed: () {
                          model.navigationService.navigateToKeranjangSayaView();
                        },
                        icon: const Icon(Icons.shopping_cart_outlined,
                            color: Colors.white),
                      ),
                      Positioned(
                        top: 5,
                        right: 5,
                        child: Container(
                          width: 20,
                          height: 20,
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: const Center(
                            child: Text(
                              '9',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            backgroundColor: backgroundColor,
            body: Column(
              children: [
                MyWhiteContainer(
                  child: IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: TextButton(
                            onPressed: () {},
                            child: const Text('Dikemas'),
                          ),
                        ),
                        const VerticalDivider(
                          color: mainGrey,
                          thickness: 1,
                        ),
                        Expanded(
                          child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Dikirim',
                              style: TextStyle(
                                color: mainGrey,
                              ),
                            ),
                          ),
                        ),
                        const VerticalDivider(
                          color: Colors.grey,
                          thickness: 1,
                        ),
                        Expanded(
                          child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Selesai',
                              style: TextStyle(
                                color: mainGrey,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: MyWhiteContainer(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          'https://a.cdn-hotels.com/gdcs/production0/d1513/35c1c89e-408c-4449-9abe-f109068f40c0.jpg?impolicy=fcrop&w=800&h=533&q=medium',
                                          height: 100,
                                          width: double.infinity,
                                          fit: BoxFit.fill,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return const Icon(Icons.error);
                                          },
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                      child: IntrinsicHeight(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                'Nama Makanan',
                                                style:
                                                    regularTextStyle.copyWith(
                                                  fontSize: 17,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Align(
                                              alignment: Alignment.centerRight,
                                              child: Text(
                                                'x 1',
                                                style:
                                                    regularTextStyle.copyWith(
                                                  color: mainGrey,
                                                  fontSize: 17,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Align(
                                              alignment: Alignment.centerRight,
                                              child: Text(
                                                'Rp. 100.000',
                                                style:
                                                    regularTextStyle.copyWith(
                                                  color: redColor,
                                                  fontSize: 17,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Center(
                                  child: Text(
                                    'Tampilkan Produk Lain',
                                    style: regularTextStyle.copyWith(
                                      color: mainGrey,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      '3 Item',
                                      style: regularTextStyle,
                                    ),
                                    const Expanded(child: SizedBox()),
                                    RichText(
                                      text: TextSpan(
                                        text: 'Total Pesanan: ',
                                        style: regularTextStyle,
                                        children: [
                                          TextSpan(
                                            text: 'Rp. 300.000',
                                            style: regularTextStyle.copyWith(
                                              color: redColor,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    // lorry icon
                                    const Icon(
                                      Icons.local_shipping_outlined,
                                      color: mainColor,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Pesanan telah sampai',
                                      style: regularTextStyle.copyWith(
                                        color: mainColor,
                                      ),
                                    ),

                                    const Expanded(child: SizedBox()),
                                    const Icon(
                                      Icons.arrow_forward_ios,
                                      color: mainGrey,
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
                  ),
                ),
              ],
            ),
            // floatingActionButton: FloatingActionButton.extended(
            //   onPressed: () {},
            //   label: Text(
            //     'Pesan',
            //     style: boldTextStyle.copyWith(color: Colors.white),
            //   ),
            //   icon: const Icon(
            //     Icons.shopping_cart,
            //     color: Colors.white,
            //   ),
            //   backgroundColor: mainColor,
            // ),
          ),
        );
      },
    );
  }
}
