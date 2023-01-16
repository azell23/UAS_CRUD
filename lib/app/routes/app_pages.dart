import 'package:get/get.dart';

import '../modules/add/bindings/add_binding.dart';
import '../modules/add/views/add_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/makanan/bindings/makanan_binding.dart';
import '../modules/makanan/views/makanan_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/update/bindings/update_binding.dart';
import '../modules/update/views/update_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.MAKANAN,
      page: () => MakananView(),
      binding: MakananBinding(),
    ),
    GetPage(
      name: _Paths.ADD,
      page: () => const AddView(),
      binding: AddBinding(),
    ),
    GetPage(
      name: _Paths.UPDATE,
      page: () => const UpdateView(id : null),
      binding: UpdateBinding(),
    ),
  ];
}
