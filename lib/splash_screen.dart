import 'package:flutter/material.dart';
import 'package:harsatapp/view/product/main_screen.dart';
import 'package:harsatapp/view/registration/login_screen.dart';
import 'package:harsatapp/widget/custom_color.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToMainScreen();
  }

  _navigateToMainScreen() async {
    await Future.delayed(Duration(milliseconds: 3000));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            children: [
              Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(180),
                              bottomRight: Radius.circular(180),
                            ),
                            color: CustomColors.mainOrange),
                        width: screenWidth,
                        height: screenHeight / 2,
                      ),
                      Container(
                        width: screenWidth,
                        height: screenHeight / 2,
                      ),
                    ],
                  ),
                  Positioned(
                    top: screenHeight / 2 -
                        50, // Logo yüksekliğinizi düzenleyebilirsiniz
                    left: screenWidth / 2 -
                        50, // Logo genişliğinizi düzenleyebilirsiniz
                    child: Image.asset(
                      "assets/logo/logo.png",
                      width: 100,
                      height: 100,
                    ),
                  ),
                  Positioned(
                    top: screenHeight / 2 +
                        50, // Logo yüksekliğinizi düzenleyebilirsiniz
                    left: screenWidth / 2 -
                        50, // Logo genişliğinizi düzenleyebilirsiniz
                    child: Image.asset(
                      "assets/logo/logo2.png",
                      width: 100,
                      height: 50,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
