// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i9;
import 'package:flutter/material.dart';
import 'package:reza_app/ui/views/daftar_user_ui/input_informasi_diri/input_informasi_diri_view.dart'
    as _i6;
import 'package:reza_app/ui/views/daftar_user_ui/masukan_no_hp/masukan_no_hp_view.dart'
    as _i4;
import 'package:reza_app/ui/views/daftar_user_ui/verifikasi_no_hp/verifikasi_no_hp_view.dart'
    as _i5;
import 'package:reza_app/ui/views/login_user/login_user_view.dart' as _i3;
import 'package:reza_app/ui/views/splash_screen/splash_screen_view.dart' as _i2;
import 'package:reza_app/ui/views/user_ui/akun_user/akun_user_view.dart'
    as _i13;
import 'package:reza_app/ui/views/user_ui/makanan_list/detail_makanan/detail_makanan_view.dart'
    as _i8;
import 'package:reza_app/ui/views/user_ui/makanan_list/makanan_list_view.dart'
    as _i11;
import 'package:reza_app/ui/views/user_ui/pesanan_list/pesanan_list_view.dart'
    as _i12;
import 'package:reza_app/ui/views/user_ui/reservasi_meja/reservasi_meja_view.dart'
    as _i10;
import 'package:reza_app/ui/views/user_ui/user_index_tracking/user_index_tracking_view.dart'
    as _i7;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i14;

class Routes {
  static const splashScreenView = '/';

  static const loginUserView = '/login-user-view';

  static const masukanNoHpView = '/masukan-no-hp-view';

  static const verifikasiNoHpView = '/verifikasi-no-hp-view';

  static const inputInformasiDiriView = '/input-informasi-diri-view';

  static const userIndexTrackingView = '/user-index-tracking-view';

  static const detailMakananView = '/detail-makanan-view';

  static const all = <String>{
    splashScreenView,
    loginUserView,
    masukanNoHpView,
    verifikasiNoHpView,
    inputInformasiDiriView,
    userIndexTrackingView,
    detailMakananView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.splashScreenView,
      page: _i2.SplashScreenView,
    ),
    _i1.RouteDef(
      Routes.loginUserView,
      page: _i3.LoginUserView,
    ),
    _i1.RouteDef(
      Routes.masukanNoHpView,
      page: _i4.MasukanNoHpView,
    ),
    _i1.RouteDef(
      Routes.verifikasiNoHpView,
      page: _i5.VerifikasiNoHpView,
    ),
    _i1.RouteDef(
      Routes.inputInformasiDiriView,
      page: _i6.InputInformasiDiriView,
    ),
    _i1.RouteDef(
      Routes.userIndexTrackingView,
      page: _i7.UserIndexTrackingView,
    ),
    _i1.RouteDef(
      Routes.detailMakananView,
      page: _i8.DetailMakananView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.SplashScreenView: (data) {
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.SplashScreenView(),
        settings: data,
      );
    },
    _i3.LoginUserView: (data) {
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.LoginUserView(),
        settings: data,
      );
    },
    _i4.MasukanNoHpView: (data) {
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.MasukanNoHpView(),
        settings: data,
      );
    },
    _i5.VerifikasiNoHpView: (data) {
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.VerifikasiNoHpView(),
        settings: data,
      );
    },
    _i6.InputInformasiDiriView: (data) {
      final args = data.getArgs<InputInformasiDiriViewArguments>(nullOk: false);
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i6.InputInformasiDiriView(key: args.key, noHp: args.noHp),
        settings: data,
      );
    },
    _i7.UserIndexTrackingView: (data) {
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.UserIndexTrackingView(),
        settings: data,
        fullscreenDialog: true,
      );
    },
    _i8.DetailMakananView: (data) {
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => const _i8.DetailMakananView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class InputInformasiDiriViewArguments {
  const InputInformasiDiriViewArguments({
    this.key,
    required this.noHp,
  });

  final _i9.Key? key;

  final String noHp;

  @override
  String toString() {
    return '{"key": "$key", "noHp": "$noHp"}';
  }

  @override
  bool operator ==(covariant InputInformasiDiriViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.noHp == noHp;
  }

  @override
  int get hashCode {
    return key.hashCode ^ noHp.hashCode;
  }
}

class UserIndexTrackingViewRoutes {
  static const reservasiMejaView = '';

  static const makananListView = 'makanan-list-view';

  static const pesananListView = 'pesanan-list-view';

  static const akunUserView = 'akun-user-view';

  static const all = <String>{
    reservasiMejaView,
    makananListView,
    pesananListView,
    akunUserView,
  };
}

class UserIndexTrackingViewRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      UserIndexTrackingViewRoutes.reservasiMejaView,
      page: _i10.ReservasiMejaView,
    ),
    _i1.RouteDef(
      UserIndexTrackingViewRoutes.makananListView,
      page: _i11.MakananListView,
    ),
    _i1.RouteDef(
      UserIndexTrackingViewRoutes.pesananListView,
      page: _i12.PesananListView,
    ),
    _i1.RouteDef(
      UserIndexTrackingViewRoutes.akunUserView,
      page: _i13.AkunUserView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i10.ReservasiMejaView: (data) {
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => const _i10.ReservasiMejaView(),
        settings: data,
      );
    },
    _i11.MakananListView: (data) {
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => const _i11.MakananListView(),
        settings: data,
      );
    },
    _i12.PesananListView: (data) {
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => const _i12.PesananListView(),
        settings: data,
      );
    },
    _i13.AkunUserView: (data) {
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => const _i13.AkunUserView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

extension NavigatorStateExtension on _i14.NavigationService {
  Future<dynamic> navigateToSplashScreenView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.splashScreenView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLoginUserView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.loginUserView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToMasukanNoHpView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.masukanNoHpView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToVerifikasiNoHpView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.verifikasiNoHpView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToInputInformasiDiriView({
    _i9.Key? key,
    required String noHp,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.inputInformasiDiriView,
        arguments: InputInformasiDiriViewArguments(key: key, noHp: noHp),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToUserIndexTrackingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.userIndexTrackingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToDetailMakananView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.detailMakananView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic>
      navigateToNestedReservasiMejaViewInUserIndexTrackingViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(UserIndexTrackingViewRoutes.reservasiMejaView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToNestedMakananListViewInUserIndexTrackingViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(UserIndexTrackingViewRoutes.makananListView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToNestedPesananListViewInUserIndexTrackingViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(UserIndexTrackingViewRoutes.pesananListView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToNestedAkunUserViewInUserIndexTrackingViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(UserIndexTrackingViewRoutes.akunUserView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSplashScreenView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.splashScreenView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLoginUserView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.loginUserView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithMasukanNoHpView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.masukanNoHpView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithVerifikasiNoHpView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.verifikasiNoHpView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithInputInformasiDiriView({
    _i9.Key? key,
    required String noHp,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.inputInformasiDiriView,
        arguments: InputInformasiDiriViewArguments(key: key, noHp: noHp),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithUserIndexTrackingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.userIndexTrackingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithDetailMakananView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.detailMakananView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic>
      replaceWithNestedReservasiMejaViewInUserIndexTrackingViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(UserIndexTrackingViewRoutes.reservasiMejaView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic>
      replaceWithNestedMakananListViewInUserIndexTrackingViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(UserIndexTrackingViewRoutes.makananListView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic>
      replaceWithNestedPesananListViewInUserIndexTrackingViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(UserIndexTrackingViewRoutes.pesananListView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithNestedAkunUserViewInUserIndexTrackingViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(UserIndexTrackingViewRoutes.akunUserView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
