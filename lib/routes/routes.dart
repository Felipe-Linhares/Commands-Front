// Package imports:

// Project imports:
import 'package:commands/modules/admin/screens/admin_homepage.dart';
import 'package:commands/modules/admin/screens/admin_profilepage.dart';
import 'package:commands/modules/admin/screens/user_listpage.dart';
import 'package:commands/screens/loginpage.dart';
import 'package:commands/screens/registrationpage.dart';
// Package imports:
import 'package:get/get.dart';

final routes = [
  // GetPage(
  //   name: '/',
  //   page: () => const SplashPage(title: 'SplashPage'),
  // ),
  GetPage(
    name: '/LoginPage',
    page: () => const LoginPage(),
  ),
  // * Admin Routes
  GetPage(
    name: '/AdminHomePage',
    page: () => const AdminHomePage(),
  ),
  GetPage(
    name: '/RegistrationPage',
    page: () => const RegistrationPage(),
  ),
  GetPage(
    name: '/UserListPage',
    page: () => const UserListPage(),
  ),
  GetPage(
    name: '/AdminProfilePage',
    page: () => const AdminProfilePage(),
  ),
];
