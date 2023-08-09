import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../../app/themes/app_colors.dart';
import '../../../../../app/themes/app_text.dart';
import '../../../../widgets/my_white_container.dart';
import './keranjang_saya_view_model.dart';

class KeranjangSayaView extends StatelessWidget {
  const KeranjangSayaView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<KeranjangSayaViewModel>.reactive(
      viewModelBuilder: () => KeranjangSayaViewModel(),
      onViewModelReady: (KeranjangSayaViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        KeranjangSayaViewModel model,
        Widget? child,
      ) {
        return Scaffold(
            appBar: AppBar(
              title: const Text('Keranjang Saya',
                  style: TextStyle(color: Colors.white)),
              backgroundColor: mainColor,
              iconTheme: const IconThemeData(color: Colors.white),
            ),
            body: Column(
              children: [
                const SizedBox(height: 15),
                Expanded(
                  child: ListView.builder(
                    itemCount: 10,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: MyWhiteContainer(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // create a checkbox
                              Checkbox(
                                // check if the value is true or false
                                value: false,
                                // if true change the value to false
                                onChanged: (bool? value) {
                                  // model.changeIsCheck(value!);
                                },
                              ),
                              const SizedBox(width: 10),
                              // create a container 100x100 that contain the image
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
                                    height: 150,
                                    width: double.infinity,
                                    fit: BoxFit.fill,
                                    errorBuilder: (context, error, stackTrace) {
                                      return const Icon(Icons.error);
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Product Name ',
                                      style: regularTextStyle.copyWith(
                                          fontSize: 16),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      'Rp. 100.000',
                                      style: boldTextStyle.copyWith(
                                          color: redColor),
                                    ),
                                    const SizedBox(height: 5),
                                    // create a row that contain minus button, value, and plus button
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        // create a button minus
                                        GestureDetector(
                                          onTap: () {},
                                          child: Container(
                                            width: 25,
                                            height: 25,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: stockColor,
                                            ),
                                            child: const Icon(
                                              Icons.remove,
                                              color: mainGrey,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        // create a text that contain value
                                        Text(
                                          '1',
                                          style: regularTextStyle.copyWith(
                                            fontSize: 16,
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        // create a button plus
                                        GestureDetector(
                                          onTap: () {},
                                          child: Container(
                                            width: 25,
                                            height: 25,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: stockColor,
                                            ),
                                            child: const Icon(
                                              Icons.add,
                                              color: mainGrey,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 15),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
              // create a shopping cart icon with a badge containing the number of items
              child: const Icon(
                Icons.shopping_cart_outlined,
                color: Colors.white,
              ),
            ));
      },
    );
  }
}
