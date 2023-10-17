import 'dart:math';

import 'package:flutter/material.dart';
import 'package:harsatapp/widget/custom_appbar.dart';
import 'package:harsatapp/view/product/main_body.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomTopAppBar(),
      body: MainBody(),
      bottomNavigationBar:
          const CustomBottomAppBar(), //custom bottom appbar düzenlenecek
    );
  }
}
