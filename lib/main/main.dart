import 'package:empresta_super_app/main/factories/home/home_page_factory.dart';
import 'package:empresta_super_app/main/factories/login/login_page_factory.dart';
import 'package:empresta_super_app/utils/dependency_Injection/injection_config.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureInjection();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Empresta Bem Melhor ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF0A2540),
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: const Color(0xFFEF6C00)), 
      ),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('pt', 'BR'),
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: makeLoginPage,
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: '/home',
          page: makeHomePage,
          transition: Transition.fadeIn,
        ),
      ],
    );
  }
}
