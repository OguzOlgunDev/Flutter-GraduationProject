import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:harsatapp/controller/product_cart_controller.dart';
import 'package:harsatapp/controller/user_controller.dart';
import 'package:harsatapp/splash_screen.dart';
import 'package:harsatapp/view/registration/login_screen.dart';
import 'package:harsatapp/widget/custom_color.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(CartController());
  await dotenv.load(fileName: "lib/.env");
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: CustomColors.mainWhite,
      ),
      title: "Harsat App",
      home: SplashScreen(),
    );
  }
}
