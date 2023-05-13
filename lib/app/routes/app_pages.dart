import 'package:get/get.dart';

import '../modules/detail_data/bindings/detail_data_binding.dart';
import '../modules/detail_data/views/detail_data_view.dart';
import '../modules/form_entry/bindings/form_entry_binding.dart';
import '../modules/form_entry/views/form_entry_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/informasi/bindings/informasi_binding.dart';
import '../modules/informasi/views/informasi_view.dart';
import '../modules/lihat_data/bindings/lihat_data_binding.dart';
import '../modules/lihat_data/views/lihat_data_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.home;

  static final routes = [
    GetPage(
      name: _Paths.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.informasi,
      page: () => const InformasiView(),
      binding: InformasiBinding(),
    ),
    GetPage(
      name: _Paths.formEntry,
      page: () => const FormEntryView(),
      binding: FormEntryBinding(),
    ),
    GetPage(
      name: _Paths.lihatData,
      page: () => const LihatDataView(),
      binding: LihatDataBinding(),
    ),
    GetPage(
      name: _Paths.detailData,
      page: () => const DetailDataView(),
      binding: DetailDataBinding(),
    ),
  ];
}
