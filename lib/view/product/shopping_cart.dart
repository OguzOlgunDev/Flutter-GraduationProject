import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:harsatapp/model/product.dart';
import 'package:harsatapp/view/product/product_tab.dart';
import 'package:harsatapp/widget/custom_appbar.dart';
import 'package:harsatapp/widget/custom_color.dart';
import 'package:harsatapp/widget/custom_text.dart';

import '../../controller/product_cart_controller.dart';

class ShoppingCartScreen extends StatefulWidget {
  const ShoppingCartScreen({Key? key}) : super(key: key);
  @override
  State<ShoppingCartScreen> createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  final CartController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    double _shadowOpacity = 0.25;
    return Scaffold(
      appBar: CustomTopAppBar2(),
      body: Obx(() {
        if (controller.products.isEmpty) {
          return Container(
            color: Colors.white,
            width: screenWidth,
            height: screenHeight,
            child: Center(
              child: Text("Sepette Ürününüz Bulunmamaktadır"),
            ),
          );
        } else {
          return Container(
            color: Colors.white,
            width: screenWidth,
            height: screenHeight,
            child: ListView.builder(
              itemCount: controller.products.length,
              itemBuilder: (BuildContext context, int index) {
                final product = controller.products.keys.toList()[index];
                final quantity = controller.products.values.toList()[index];

                return CartProductCard(
                  controller: controller,
                  index: index,
                  product: product,
                  quantity: quantity,
                );
              },
            ),
          );
        }
      }),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(8),
            topLeft: Radius.circular(8),
          ),
          boxShadow: [
            BoxShadow(
              color: CustomColors.mainGrey.withOpacity(_shadowOpacity),
              offset: const Offset(0, 0),
              blurRadius: 15.0,
              spreadRadius: 5.0,
            ),
          ],
          color: CustomColors.mainWhite,
        ),
        width: screenWidth,
        height: screenHeight * 0.20,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  right: 36.0, left: 32.0, top: 16, bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BlackText(
                      text: "Toplam Tutar:",
                      size: 20,
                      fontWeight: FontWeight.w400),
                  BlackText(
                    text: controller.products.isEmpty
                        ? "Total: 0₺"
                        : "${controller.total}₺",
                    size: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40, top: 12),
                  child: Container(
                    height: 30,
                    width: 300,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(CustomColors.mainGreen),
                      ),
                      onPressed: () {},
                      child: WhiteText(
                        text: "ALIŞVERİŞİ TAMAMLA",
                        size: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 40, right: 40, top: 12),
                child: Container(
                  child: InkWell(
                    onTap: () {
                      Get.to(() => ProductTab(
                            selectedIndex: 0,
                          ));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: CustomColors.darkGreen,
                            width: 2.0,
                          ),
                        ),
                      ),
                      child: GreenText(
                        text: "Alışverişe Devam Et",
                        size: 16,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CartProductCard extends StatelessWidget {
  final CartController controller;
  final Product product;
  final int quantity;
  final int index;

  const CartProductCard(
      {Key? key,
      required this.controller,
      required this.product,
      required this.quantity,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
      child: Container(
        width: screenWidth * 0.89,
        height: screenHeight * 0.16,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          border: Border.all(
            color: CustomColors.mainGrey,
            width: 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {
                      controller.removeProductPerminantly(product);
                    },
                    icon: Icon(
                      Icons.delete_rounded,
                      color: CustomColors.mainRed,
                      size: 28.0,
                    ),
                  ),
                  Container(
                    height: screenHeight * 0.13,
                    width: screenHeight * 0.13,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        product.imgPath,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4, bottom: 4, left: 4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BlackText(
                              text: product.name,
                              size: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            GreyText(
                                text: product.province + "/" + product.city,
                                size: 14,
                                fontWeight: FontWeight.w400)
                          ],
                        ),
                        BlackText(
                            text: "${quantity * product.price} ₺",
                            size: 20,
                            fontWeight: FontWeight.bold)
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      controller.addProduct(product);
                    },
                    child: Container(
                      width: 32,
                      height: 32,
                      child: Icon(Icons.add),
                    ),
                  ),
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: WhiteText(
                        text: '$quantity',
                        size: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (quantity != 1) controller.removeProducts(product);
                    },
                    child: Container(
                      width: 32,
                      height: 32,
                      child: Icon(Icons.remove),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
