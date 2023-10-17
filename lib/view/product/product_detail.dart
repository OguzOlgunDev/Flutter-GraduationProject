import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:harsatapp/model/review.dart';
import 'package:harsatapp/view/product/review_list.dart';
import 'package:harsatapp/view/product/review_screen.dart';
import 'package:harsatapp/widget/custom_appbar.dart';
import 'package:harsatapp/model/product.dart';
import 'package:harsatapp/widget/custom_color.dart';
import 'package:harsatapp/widget/custom_text.dart';

import '../../controller/product_cart_controller.dart';

class ProductDetail extends StatefulWidget {
  final List<Product> productDetail;

  final indexProduct;

  const ProductDetail({
    Key? key,
    required this.indexProduct,
    required this.productDetail,
  }) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  final cartController = Get.put(CartController());
  int miktar = 1;
  int total_price = 0;
  final double _shadowOpacity = 0.25;
  late final Review review;

  /*@override
  void initState() {
    super.initState();
    review = Review.generateReview(); // Review örneği oluşturarak review değişkenini başlatma
  }*/

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomTopAppBar2(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 16, bottom: 16),
              child: Container(
                height: screenHeight * 0.28,
                width: screenWidth * 0.866,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    widget.productDetail[widget.indexProduct].imgPath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 4, 20, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BlackText(
                    text: widget.productDetail[widget.indexProduct].name,
                    size: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  Row(
                    children: [
                      BlackText(
                        text:
                            '${widget.productDetail[widget.indexProduct].price}' +
                                "₺",
                        size: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      BlackText(
                        text:
                            "/${widget.productDetail[widget.indexProduct].unit}",
                        size: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 4, 20, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      BlackText(
                        text: widget.productDetail[widget.indexProduct].bayi,
                        size: 18,
                        fontWeight: FontWeight.w400,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: CustomColors.mainGrey,
                          ),
                          ColorText(
                            color: CustomColors.mainGrey,
                            text:
                                '${widget.productDetail[widget.indexProduct].star}',
                            size: 12,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      BlackText(
                        text:
                            '${widget.productDetail[widget.indexProduct].province}',
                        size: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      BlackText(
                        text:
                            "/${widget.productDetail[widget.indexProduct].city}",
                        size: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: screenWidth,
                child: GreyText(
                  text:
                      "Lorem ipsum dolor sit amet consectetur. maierus egestas morbi massa tristique condimentum pharetra",
                  size: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BlackText(
                          text: "Değerlendirmeler",
                          size: 16,
                          fontWeight: FontWeight.w400),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ReviewScreen()),
                          );
                        },
                        child: PurpleText(
                          text: "Tümünü Gör",
                        ),
                      ), // Button to view all news
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    width: screenWidth,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: CustomColors.mainGrey,
                        width: 1.0,
                      ),
                    ),
                    child: ReviewList(
                      review: Review.generateReview(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
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
        height: screenHeight * 0.205,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GreyText(
                    text: "Miktar:",
                    size: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: CustomColors.darkGreen,
                            width: 2,
                          ),
                        ),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            setState(() {
                              if (miktar != 1) {
                                miktar -= 1;
                                total_price = miktar *
                                    widget.productDetail[widget.indexProduct]
                                        .price;
                              }
                            });
                          },
                          icon: Icon(
                            Icons.remove,
                            size: 20,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Text(
                            '${miktar}',
                            style: TextStyle(
                              fontSize:
                                  20, // Adjust the font size of '1' as desired
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(13,
                                -8), // Adjust the vertical offset as desired
                            child: Text(
                              'Ton',
                              style: TextStyle(
                                fontSize: 8,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: CustomColors.lightGreen,
                            width: 2,
                          ),
                        ),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            setState(() {
                              miktar += 1;
                              total_price = miktar *
                                  widget
                                      .productDetail[widget.indexProduct].price;
                            });
                          },
                          icon: Icon(
                            Icons.add,
                            size: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  right: 16.0, left: 16.0, top: 4, bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Toplam Tutar:",
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    "${miktar * widget.productDetail[widget.indexProduct].price} ₺",
                    style: TextStyle(fontSize: 18),
                  )
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
                      onPressed: () {
                        while (miktar > 0) {
                          miktar -= 1;
                          cartController.addProduct(
                              widget.productDetail[widget.indexProduct]);
                        }
                      },
                      child: WhiteText(
                        text: "SEPETE EKLE",
                        size: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
