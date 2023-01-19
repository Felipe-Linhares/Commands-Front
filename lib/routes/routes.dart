// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:commands/modules/admin/screens/admin_homepage.dart';
import 'package:commands/modules/admin/screens/admin_profilepage.dart';
import 'package:commands/modules/comandas/screens/commands_homepage.dart';
import 'package:commands/modules/comandas/screens/commands_registrationpage.dart';
import 'package:commands/modules/user/screens/user_listpage.dart';
import 'package:commands/modules/user/screens/user_profilepage.dart';
import 'package:commands/modules/user/screens/user_registrationpage.dart';
import 'package:commands/modules/user/screens/user_update_profilepage.dart';
import 'package:commands/screens/loginpage.dart';
import 'package:commands/screens/splashpage.dart';

final routes = [
  GetPage(
    name: '/',
    page: () => const SplashPage(),
  ),
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

  // * USER

  GetPage(
    name: '/UserProfilePage',
    page: () => const UserProfilePage(),
  ),
  GetPage(
    name: '/UserUpdateProfilePage',
    page: () => const UserUpdateProfilePage(),
  ),
  GetPage(
    name: '/UserRegistrationPage',
    page: () => const UserRegistrationPage(),
  ),
  GetPage(
    name: '/UserListPage',
    page: () => const UserListPage(),
  ),
];
