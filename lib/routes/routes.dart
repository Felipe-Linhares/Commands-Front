// Package imports:

// Project imports:
import 'package:commands/modules/admin/screens/admin_homepage.dart';
import 'package:commands/modules/admin/screens/admin_profilepage.dart';
import 'package:commands/modules/admin/screens/user_listpage.dart';
import 'package:commands/modules/comandas/screens/commands_homepage.dart';
import 'package:commands/modules/comandas/screens/commands_registrationpage.dart';
import 'package:commands/modules/user/screens/user_registrationpage.dart';
import 'package:commands/screens/loginpage.dart';
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
    name: '/UserRegistrationPage',
    page: () => const UserRegistrationPage(),
  ),
  GetPage(
    name: '/UserListPage',
    page: () => const UserListPage(),
  ),
  GetPage(
    name: '/AdminProfilePage',
    page: () => const AdminProfilePage(),
  ),

  // * COMMANDS

  GetPage(
    name: '/CommandsHomePage',
    page: () => const CommandsHomePage(),
  ),
  GetPage(
    name: '/CommandsRegistrationPage',
    page: () => const CommandsRegistrationPage(),
  ),
];
