// // Package imports:
// import 'package:local_auth/local_auth.dart';
// import 'package:local_auth_android/local_auth_android.dart';

// class LocalAuthServices {
//   final LocalAuthentication auth;

//   LocalAuthServices({required this.auth});

//   Future<bool> isBiometricEnabled() async {
//     final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
//     return canAuthenticateWithBiometrics || await auth.isDeviceSupported();
//   }

//   Future<bool> authenticate() async {
//     return await auth.authenticate(
//         localizedReason: 'Por favor, autentique-se para acessar o app.',
//         options: const AuthenticationOptions(stickyAuth: true),
//         authMessages: const <AuthMessages>[
//           AndroidAuthMessages(
//               signInTitle: 'A autenticação é necessária para avançar.',
//               biometricHint: 'Confimar identidade',
//               cancelButton: 'No thanks',
//               biometricNotRecognized: 'NOT REOGARNIXZE',
//               biometricSuccess: 'sUCESS',
//               biometricRequiredTitle: 'iDENTIDADE REQUERIDA',
//               deviceCredentialsRequiredTitle: 'TITULO CREDENTIAL',
//               deviceCredentialsSetupDescription: 'DESCRIBE',
//               goToSettingsButton: 'BUTTON SETTINGD',
//               goToSettingsDescription: 'DESCRIPITION'),
//         ]);
//   }
// }
