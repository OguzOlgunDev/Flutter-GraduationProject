import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:harsatapp/controller/user_controller.dart';
import 'package:harsatapp/model/news.dart';
import 'package:harsatapp/model/supplier.dart';
import 'package:harsatapp/view/account/account_screen.dart';
import 'package:harsatapp/view/account/address.dart';
import 'package:harsatapp/view/account/personal.dart';
import 'package:harsatapp/view/news/news_screen.dart';
import 'package:harsatapp/view/product/main_screen.dart';
import 'package:harsatapp/view/product/product_tab.dart';
import 'package:harsatapp/view/product/shopping_cart.dart';
import 'package:harsatapp/view/supplier/supplier_screen.dart';
import 'package:harsatapp/widget/custom_color.dart';

class CustomTopAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height = 64;
  const CustomTopAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 1,
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
            decoration: const BoxDecoration(
              color: CustomColors.mainWhite,
              border: Border(
                bottom: BorderSide(width: 1.0, color: CustomColors.mainGrey),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  alignment: Alignment.center,
                  child: IconButton(
                    padding: const EdgeInsets.all(0.0),
                    icon: Image.asset('assets/logo/logo.png'),
                    onPressed: () {
                      Get.to(() => MainScreen());
                    },
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.to(() => ShoppingCartScreen());
                      },
                      padding: const EdgeInsets.all(0.0),
                      icon: const Icon(Icons.shopping_cart, size: 32.0),
                      color: CustomColors.darkGreen,
                    ),
                    IconButton(
                      onPressed: () {
                        Get.to(() => AccountScreen());
                      },
                      padding: const EdgeInsets.all(0.0),
                      icon: const Icon(Icons.person, size: 40.0),
                      color: CustomColors.mainGrey,
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}

class CustomBottomAppBar extends StatefulWidget {
  const CustomBottomAppBar({Key? key}) : super(key: key);

  @override
  State<CustomBottomAppBar> createState() => _CustomBottomAppBarState();
}

class _CustomBottomAppBarState extends State<CustomBottomAppBar> {
  int _currentIndex = 0;
  static const double _shadowOpacity = 0.1;
  ValueNotifier<int> _currentIndexNotifier = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: _calculatePreferredSize(),
      child: Container(
        padding: const EdgeInsets.fromLTRB(24, 8, 24, 12),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12.0),
            topRight: Radius.circular(12.0),
          ),
          color: CustomColors.mainWhite,
          boxShadow: [
            BoxShadow(
              color: CustomColors.lightGreen.withOpacity(_shadowOpacity),
              offset: const Offset(0, -6),
              blurRadius: 4.0,
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildIconButton(0, Icons.home, "Ana"),
            _buildIconButton(1, Icons.style_rounded, "Ürün"),
            _buildIconButton(2, Icons.business_center_rounded, "Bayi"),
            _buildIconButton(3, Icons.newspaper_rounded, "Haber"),
          ],
        ),
      ),
    );
  }

  Widget _buildIconButton(int index, IconData icon, String label) {
    return ValueListenableBuilder<int>(
      valueListenable: _currentIndexNotifier,
      builder: (context, value, _) {
        Color iconColor =
            value == index ? CustomColors.mainOrange : CustomColors.darkGreen;

        return InkWell(
          onTap: () {
            setState(() {
              _currentIndex = index;
            });

            // Perform navigation to the desired page
            _navigateToPage(index);
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 32.0,
                color: iconColor,
              ),
              Text(
                label,
                style: TextStyle(
                  fontFamily: 'assets/fonts/Lato-Regular.ttf',
                  fontSize: 14,
                  color: iconColor,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _navigateToPage(int index) {
    switch (index) {
      case 0:
        // Navigate to the home page
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MainScreen()));
        break;

      case 1:
        // Navigate to the product page
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => ProductTab(
                      selectedIndex: 0,
                    )));
        break;
      case 2:
        // Navigate to the supplier page
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  SupplierScreen(supplier: Supplier.generateSuppliers())),
        );
        break;
      case 3:
        // Navigate to the news page
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => NewsScreen(
                      news: News.generateNews(),
                    )));
        break;
    }
  }

  Size _calculatePreferredSize() {
    final height = MediaQuery.of(context).size.height * 0.08;
    return Size.fromHeight(height);
  }
}

class CustomTopAppBar2 extends StatelessWidget implements PreferredSizeWidget {
  final double height = 64;
  const CustomTopAppBar2({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 1,
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
            decoration: const BoxDecoration(
              color: CustomColors.mainWhite,
              border: Border(
                bottom: BorderSide(width: 1.0, color: CustomColors.mainGrey),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  alignment: Alignment.center,
                  child: IconButton(
                    padding: const EdgeInsets.all(0.0),
                    icon: const Icon(Icons.arrow_back_ios_new_rounded,
                        size: 28.0),
                    onPressed: () {
                      Navigator.pop(
                          context); // Navigate back to the previous page
                    },
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.to(() => ShoppingCartScreen());
                      },
                      padding: const EdgeInsets.all(0.0),
                      icon: const Icon(Icons.shopping_cart, size: 32.0),
                      color: CustomColors.darkGreen,
                    ),
                    IconButton(
                      onPressed: () {
                        Get.to(() => AccountScreen());
                      },
                      padding: const EdgeInsets.all(0.0),
                      icon: const Icon(Icons.person, size: 40.0),
                      color: CustomColors.mainGrey,
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
