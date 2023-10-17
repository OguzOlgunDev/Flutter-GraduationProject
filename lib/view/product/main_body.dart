import 'package:flutter/material.dart';
import 'package:harsatapp/model/news.dart';
import 'package:harsatapp/model/product.dart';
import 'package:harsatapp/model/supplier.dart';
import 'package:harsatapp/view/news/news_detail.dart';
import 'package:harsatapp/view/news/news_screen.dart';
import 'package:harsatapp/view/product/product_tab.dart';
import 'package:harsatapp/view/supplier/supplier_detail.dart';
import 'package:harsatapp/view/supplier/supplier_screen.dart';
import 'package:harsatapp/widget/custom_text.dart';
import 'package:harsatapp/widget/custom_color.dart';

class MainBody extends StatelessWidget {
  // Define the lists of product categories, news, and suppliers
  final List<ProductCategory> productCategory =
      ProductCategory.generateProductCategory();
  final List<News> news = News.generateNews();
  final List<Supplier> supplier = Supplier.generateSuppliers();
  MainBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: CustomColors.mainWhite,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            // First section for News
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Header for News section
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 12, 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BlackText(
                              text: "HABERLER",
                              size: 22,
                              fontWeight: FontWeight.w400),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => NewsScreen(
                                    news: News.generateNews(),
                                  ),
                                ),
                              );
                            },
                            child: PurpleText(),
                          ), // Button to view all news
                        ],
                      ),
                    ),

                    // News card list
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: news.length,
                        itemBuilder: (BuildContext ctx, int index) {
                          return GestureDetector(
                            onTap: () {
                              // Navigate to detail page
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => NewsDetail(
                                      indexNews: index, newsDetail: news),
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
                              child: Card(
                                elevation: 0,
                                child: Container(
                                  width: 256,
                                  height: 144,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(news[index].imgPath),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Second section for Product Categories
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Header for Products section
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 12, 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BlackText(
                              text: "ÜRÜNLER",
                              size: 22,
                              fontWeight: FontWeight.w400),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProductTab(
                                            selectedIndex: 0,
                                          )));
                            },
                            child: PurpleText(),
                          ), // Button to view all Products
                        ],
                      ),
                    ),

                    // Products card list
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: productCategory.length,
                        itemBuilder: (BuildContext ctx, int index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ProductTab(selectedIndex: index)));
                            },
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
                              child: Card(
                                //color: CustomColors.lightGreen,
                                elevation: 0,
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 110,
                                        height: 110,
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(8),
                                          ),
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                                productCategory[index].imgPath),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      BlackText(
                                          text: productCategory[index].name,
                                          size: 16,
                                          fontWeight: FontWeight.w400)
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Third section for Suppliers
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Header for Supplier section
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 12, 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BlackText(
                              text: "BAYİLER",
                              size: 22,
                              fontWeight: FontWeight.w400),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SupplierScreen(
                                        supplier:
                                            Supplier.generateSuppliers())),
                              );
                            },
                            child: PurpleText(),
                          ), // Button to view all Suppliers
                        ],
                      ),
                    ),

                    // Supplier card list
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: supplier.length,
                        itemBuilder: (BuildContext ctx, int index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SupplierDetail(
                                      supplierDetail: supplier,
                                      indexSupplier: index),
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 16, 16),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  //set border radius more than 50% of height and width to make circle
                                ),
                                elevation: 0,
                                color: CustomColors.lightGreen.withOpacity(0.1),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          width: 125,
                                          height: 144,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              fit: BoxFit.contain,
                                              image: AssetImage(
                                                  supplier[index].imgPath),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      BlackText(
                                          text: supplier[index].name,
                                          size: 20,
                                          fontWeight: FontWeight.w400),
                                      Row(
                                        children: [
                                          GreenText(
                                              text: supplier[index].province,
                                              size: 16),
                                          GreenText(text: "/", size: 16),
                                          GreenText(
                                              text: supplier[index].city,
                                              size: 16),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
