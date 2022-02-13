import 'package:cobacli/app/controllers/auth_controller.dart';
import 'package:cobacli/app/utils/error_screen.dart';
import 'package:cobacli/app/utils/loading_screen.dart';
import 'package:cobacli/app/utils/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(_MyApp());
}

class _MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initializzation = Firebase.initializeApp();

  final authC = Get.put(AuthController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initializzation,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const ErrorScreen();
          }

          if (snapshot.connectionState == ConnectionState.done) {
            // return GetMaterialApp(
            //   debugShowCheckedModeBanner: false,
            //   title: "App ",
            //   initialRoute: Routes.LOGIN,
            //   getPages: AppPages.routes,
            // );
            return FutureBuilder(
                future: Future.delayed(const Duration(seconds: 3)),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Obx(() => GetMaterialApp(
                          debugShowCheckedModeBanner: false,
                          title: "ChatApp ",
                          initialRoute: authC.isSkipIntro.isTrue
                              ? authC.isAuth.isTrue
                                  ? Routes.HOME
                                  : Routes.LOGIN
                              : Routes.INTRODUCTION,
                          getPages: AppPages.routes,
                        ));
                  }
                  return FutureBuilder(
                      future: authC.firstInitialized(),
                      builder: (context, snapshot) => const SplashScreen());
                });
          }
          return const LoadingScreen();
        });
  }
}
