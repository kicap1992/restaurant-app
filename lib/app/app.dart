import 'package:reza_app/services/global_var.dart';
import 'package:reza_app/services/other_function.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked/stacked_annotations.dart';

import '../services/http_services.dart';
import '../services/my_easyloading.dart';
import '../services/my_socket_io_client.dart';
import '../ui/views/daftar_user_ui/input_informasi_diri/input_informasi_diri_view.dart';
import '../ui/views/daftar_user_ui/masukan_no_hp/masukan_no_hp_view.dart';
import '../ui/views/daftar_user_ui/verifikasi_no_hp/verifikasi_no_hp_view.dart';
import '../ui/views/login_user/login_user_view.dart';
import '../ui/views/meja_detail/meja_detail_view.dart';
import '../ui/views/splash_screen/splash_screen_view.dart';
import '../ui/views/user_ui/akun_user/akun_user_view.dart';
import '../ui/views/user_ui/makanan_list/detail_makanan/detail_makanan_view.dart';
import '../ui/views/user_ui/makanan_list/makanan_list_view.dart';
import '../ui/views/user_ui/pesanan_list/keranjang_saya/keranjang_saya_view.dart';
import '../ui/views/user_ui/pesanan_list/pesanan_list_view.dart';
import '../ui/views/user_ui/reservasi_meja/reservasi_meja_view.dart';
import '../ui/views/user_ui/user_index_tracking/user_index_tracking_view.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: SplashScreenView, initial: true),
    MaterialRoute(page: LoginUserView),
    MaterialRoute(page: MasukanNoHpView),
    MaterialRoute(page: VerifikasiNoHpView),
    MaterialRoute(page: InputInformasiDiriView),
    MaterialRoute(
      page: UserIndexTrackingView,
      fullscreenDialog: true,
      children: [
        MaterialRoute(page: ReservasiMejaView, initial: true),
        MaterialRoute(page: MakananListView),
        MaterialRoute(page: PesananListView),
        MaterialRoute(page: AkunUserView),
      ],
    ),
    MaterialRoute(page: DetailMakananView),
    MaterialRoute(page: MejaDetailView),
    MaterialRoute(page: KeranjangSayaView)
  ],
  // dialogs: [
  //   StackedDialog(classType: AddSiswaDialogView),
  // ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: BottomSheetService),
    //

    LazySingleton(classType: MyEasyLoading),
    LazySingleton(classType: MyHttpServices),
    LazySingleton(classType: OtherFunction),
    LazySingleton(classType: GlobalVar),
    LazySingleton(classType: MySocketIoClient),
  ],
  logger: StackedLogger(),
)
class App {}
