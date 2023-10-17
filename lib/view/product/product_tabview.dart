import 'package:flutter/material.dart';
import 'package:harsatapp/model/review.dart';
import 'package:harsatapp/widget/custom_color.dart';
import 'package:harsatapp/view/product/main_screen.dart';
import 'package:harsatapp/widget/custom_text.dart';
import 'package:harsatapp/view/product/product_detail.dart';
import 'package:harsatapp/model/product.dart';
import 'package:provider/provider.dart';

class ProductTabView extends StatefulWidget {
  final List<Product> product;

  ProductTabView({Key? key, required this.product}) : super(key: key);

  @override
  _ProductTabViewState createState() => _ProductTabViewState();
}

class _ProductTabViewState extends State<ProductTabView> {
  final double _shadowOpacity = 0.25;
  late double screenWidth;
  late double screenHeight;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: (widget.product.length / 2).ceil(),
      itemBuilder: (context, index) {
        int firstIndex = index * 2;
        int secondIndex = index * 2 + 1;

        return Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (firstIndex < widget.product.length) ...[
                buildProductCard(firstIndex),
              ],
              const SizedBox(width: 21),
              if (secondIndex < widget.product.length) ...[
                buildProductCard(secondIndex),
              ],
            ],
          ),
        );
      },
    );
  }

  Widget buildProductCard(int index) {
    return Flexible(
      flex: 1,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetail(
                      indexProduct: index,
                      productDetail: widget.product,
                    )),
          );
        },
        child: Card(
          child: Container(
            width: screenWidth * 0.395,
            height: screenHeight * 0.30,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
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
            child: Column(
              children: [
                Container(
                  width: screenWidth * 0.395,
                  height: screenHeight * 0.16,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(widget.product[index].imgPath),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: BlackText(
                            text: widget.product[index].name,
                            size: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GreyText(
                            text: widget.product[index].bayi,
                            size: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          GreyText(
                            text: widget.product[index].province,
                            size: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                    height:
                        10), // Add spacing between the previous section and the next section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: CustomColors.mainOrange,
                          ),
                          ColorText(
                            color: CustomColors.mainOrange,
                            text: '${widget.product[index].star}',
                            size: 12,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          BlackText(
                            text: '${widget.product[index].price}' + "₺",
                            size: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          BlackText(
                            text: "/" + '${widget.product[index].unit}',
                            size: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
