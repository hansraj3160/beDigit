import 'package:nexime/view/dashboard/dashboard_view.dart';

import 'package:nexime/view/login/login_controller.dart';
import 'package:nexime/view/login/login_view.dart';

import 'package:nexime/view/splash/splash_view.dart';

import '../util/app_export.dart';

class AppRoute {
  static String initial = '/';
  static String dashboard = '/dashboard';

  static String login = '/login';

  
  static List<GetPage<dynamic>>? getPages = [
    GetPage(
      name: initial,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    
     GetPage(
      name: login,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    
     GetPage(
      name: dashboard,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
  ];
}
