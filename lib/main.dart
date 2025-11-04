import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projct2/bindings/intialbindings.dart';
import 'package:projct2/core/services/services.dart';
import 'package:projct2/routes.dart';
import 'package:projct2/view/screen/onboarding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),

      initialBinding: InitialBindings(),
      //  home: const Onboarding(),
      getPages: routes,
    );
  }
}
