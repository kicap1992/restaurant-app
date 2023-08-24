import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:reza_app/app/themes/app_colors.dart';
import 'package:stacked/stacked.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../meja_detail/meja_detail_view.dart';
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
              title: const Text('RESERVASI MEJA',
                  style: TextStyle(color: Colors.white)),
              backgroundColor: mainColor,
              automaticallyImplyLeading: false,
              actions: [
                // create a shopping cart icon with a badge containing the number of items
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  child: Stack(
                    children: [
                      IconButton(
                        onPressed: () {},
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
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                CarouselSlider.builder(
                  itemCount: model.imagePaths.length,
                  itemBuilder:
                      (BuildContext context, int index, int realIndex) {
                    return SizedBox(
                      width: MediaQuery.of(context)
                          .size
                          .width, // Set the width to full width
                      child: Image.asset(
                        model.imagePaths[index],
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                  options: CarouselOptions(
                    autoPlay: true,
                    aspectRatio: 2.0,
                    enlargeCenterPage: true,
                  ),
                ),
                Expanded(
                  // child: SizedBox(),
                  child: WebView(
                    initialUrl: dotenv.env['table_url'],
                    // initialUrl: 'http://172.29.85.181/parkir/user',
                    // initialUrl: 'https://rekam-medis.airlangga-it.com/',
                    javascriptMode: JavascriptMode.unrestricted,
                    onWebViewCreated: (WebViewController webViewController) {
                      model.webViewController = webViewController;
                    },
                    onProgress: (int progress) {
                      // model.log.i('WebView is loading (progress : $progress%)');
                      // show a loading indicator when the WebView is loading using circular progress indicator
                      model.easyLoading.customLoading('Loading Data Meja');
                    },
                    // javascriptChannels: <JavascriptChannel>{
                    //   _toasterJavascriptChannel(context),
                    // },
                    javascriptChannels: <JavascriptChannel>{
                      JavascriptChannel(
                        name: 'messageHandler',
                        onMessageReceived: (JavascriptMessage message) async {
                          // model.log.i('messageHandler : ${message.message}');
                          // model.easyLoading.backPressed = 1;
                          model.notifyListeners();
                          // model.log.i(
                          //     'backPressed : ${model.easyLoading.backPressed}');
                          String mejaId = message.message;
                          model.navigationService.navigateToView(
                            MejaDetailView(
                              mejaId: mejaId,
                            ),
                          );
                        },
                      ),
                      JavascriptChannel(
                        name: 'messageHandler1',
                        onMessageReceived: (JavascriptMessage message) async {
                          // String no_telpon = message.message;
                          // dev.i('no_telpon : $no_telpon');
                          // await launchUrl(Uri.parse('tel:$no_telpon'));
                        },
                      ),
                    },
                    navigationDelegate: (NavigationRequest request) async {
                      // if (request.url.startsWith('https://www.youtube.com/')) {
                      //   dev.log('blocking navigation to $request}');
                      //   return NavigationDecision.prevent;
                      // }
                      // check if request.url has 'nrm'

                      return NavigationDecision.navigate;
                    },
                    onPageStarted: (String url) {
                      model.log.i('Page started loading: $url');
                    },
                    onPageFinished: (String url) {
                      model.log.i('Page finished loading: $url');
                      model.easyLoading.dismissLoading();
                    },
                    gestureNavigationEnabled: true,
                    backgroundColor: const Color(0x00000000),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // create 3 circle color
                      Container(
                        width: 20,
                        height: 20,
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(223, 216, 214, 1),
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 5),
                      const Text('Tersedia'),
                      const SizedBox(width: 10),

                      Container(
                        width: 20,
                        height: 20,
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 5),
                      const Text('Dibooking'),

                      const SizedBox(width: 10),
                      Container(
                        width: 20,
                        height: 20,
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 5),
                      const Text('Tidak Tersedia'),
                      const SizedBox(width: 10),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
