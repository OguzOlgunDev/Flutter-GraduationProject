import 'package:flutter/material.dart';
import 'package:harsatapp/widget/custom_color.dart';
import 'package:harsatapp/model/product.dart';
import 'package:harsatapp/widget/custom_text.dart';
import 'package:harsatapp/widget/custom_appbar.dart';
import 'package:harsatapp/view/product/product_tabview.dart';
import 'package:harsatapp/view/product/product_detail.dart';

class ProductTab extends StatefulWidget {
  final int selectedIndex;

  ProductTab({required this.selectedIndex});

  @override
  _ProductTabState createState() => _ProductTabState();
}

class _ProductTabState extends State<ProductTab>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late int selectedIndex;

  void changeTab(int index) {
    setState(() {
      selectedIndex = index;
      _tabController.index = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: 4, vsync: this, initialIndex: widget.selectedIndex);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: const CustomTopAppBar(),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 22,
        ),
        child: Column(
          children: [
            Row(),
            Padding(
              padding: const EdgeInsets.only(top: 4, bottom: 4),
              child: SizedBox(
                width: screenWidth,
                height: screenHeight *
                    0.04, // Ekran yüksekliğinin %4'sü kadar bir yükseklik
                child: TabBar(
                  controller: _tabController,
                  isScrollable: true,
                  physics: const BouncingScrollPhysics(),
                  unselectedLabelColor: CustomColors.darkGreen,
                  labelColor: CustomColors.mainWhite,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: CustomColors.mainGreen,
                  ),
                  tabs: [
                    Tab(
                      child: GestureDetector(
                        onTap: () => changeTab(0),
                        child: Container(
                          padding: EdgeInsets.only(
                              left: screenWidth * 0.044,
                              right: screenWidth * 0.044),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                                color: CustomColors.mainGreen, width: 1),
                          ),
                          child: const Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Tohum",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'assets/fonts/Lato-Regular.ttf',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: GestureDetector(
                        onTap: () => changeTab(1),
                        child: Container(
                          padding: EdgeInsets.only(
                              left: screenWidth * 0.044,
                              right: screenWidth * 0.044),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                                color: CustomColors.mainGreen, width: 1),
                          ),
                          child: const Align(
                            alignment: Alignment.center,
                            child: Text(
                              "İlaç",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'assets/fonts/Lato-Regular.ttf',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: GestureDetector(
                        onTap: () => changeTab(2),
                        child: Container(
                          padding: EdgeInsets.only(
                              left: screenWidth * 0.044,
                              right: screenWidth * 0.044),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                                color: CustomColors.mainGreen, width: 1),
                          ),
                          child: const Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Gübre",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'assets/fonts/Lato-Regular.ttf',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: GestureDetector(
                        onTap: () => changeTab(3),
                        child: Container(
                          padding: EdgeInsets.only(
                              left: screenWidth * 0.044,
                              right: screenWidth * 0.044),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                                color: CustomColors.mainGreen, width: 1),
                          ),
                          child: const Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Sulama",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'assets/fonts/Lato-Regular.ttf',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: screenHeight *
                        0.02), // Ekran yüksekliğinin %2'si kadar bir boşluk ekleyin
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    ProductTabView(product: Product.generateTohumCategory()),
                    ProductTabView(product: Product.generateIlacCategory()),
                    ProductTabView(product: Product.generateGubreCategory()),
                    ProductTabView(product: Product.generateSulamaCategory()),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomAppBar(),
    );
  }
}
