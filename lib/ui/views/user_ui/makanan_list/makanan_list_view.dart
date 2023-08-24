import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:reza_app/ui/widgets/my_textformfield.dart';
import 'package:reza_app/ui/widgets/my_white_container.dart';
import 'package:stacked/stacked.dart';

import '../../../../app/themes/app_colors.dart';
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
            backgroundColor: backgroundColor,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // get the top height of the notification bar
                SizedBox(
                  height: MediaQuery.of(context).padding.top,
                ),
                MyWhiteContainer(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: IconButton(
                          onPressed: () {
                            if (model.globalVar.backPressed == 'exitApp') {
                              model.quitApp(context);
                              model.globalVar.backPressed = 'exitApp';
                            } else {
                              model.navigationService.back();
                            }
                          },
                          icon: const Icon(Icons.arrow_back),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 10,
                        child: MyTextFormField(
                          // controller: model.searchController,
                          hintText: 'Cari Makanan',
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.search),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.filter_list),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text('Filter'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                MyWhiteContainer(
                  child: IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: TextButton(
                            onPressed: () {},
                            child: const Text('Terbaru'),
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
                              'Terlaris',
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
                            child: const Row(
                              children: [
                                Text(
                                  'Harga',
                                  style: TextStyle(
                                    color: mainGrey,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_drop_down,
                                  color: mainGrey,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: model.isBusy
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : (model.listMakanan.isEmpty
                          ? const Center(
                              child: Text('Data Kosong'),
                            )
                          : SingleChildScrollView(
                              child: Wrap(
                                spacing: 5,
                                runSpacing: 10,
                                // alignment: WrapAlignment.spaceAround,
                                // crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  for (var i = 0;
                                      i < model.listMakanan.length;
                                      i++)
                                    GestureDetector(
                                      onTap: () => model.goToDetailMakanan(
                                          model.listMakanan[i]),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          left: 10,
                                          // right: 5,
                                        ),
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.46,
                                          color: Colors.white,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Image.network(
                                                '${dotenv.env['url']}assets/makanan/${model.listMakanan[i].imgUrl}',
                                                height: 150,
                                                width: double.infinity,
                                                fit: BoxFit.fill,
                                              ),
                                              // Image.asset(
                                              //   'assets/nasi_goreng.jpg',
                                              //   height: 150,
                                              //   width: double.infinity,
                                              //   fit: BoxFit.fill,
                                              // ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  left: 5,
                                                ),
                                                child: Text(
                                                  model.listMakanan[i]
                                                      .namaMakanan!,
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  left: 5,
                                                ),
                                                child: Text(
                                                  model.listMakanan[i]
                                                      .deskripsiMakanan!,
                                                  style: const TextStyle(
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            )),
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
              // create a shopping cart icon with a badge containing the number of items
              child: Container(
                margin: const EdgeInsets.only(right: 10),
                child: Stack(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.shopping_cart_outlined,
                          color: Colors.white),
                      iconSize: 30,
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
            ),
          ),
        );
      },
    );
  }
}
