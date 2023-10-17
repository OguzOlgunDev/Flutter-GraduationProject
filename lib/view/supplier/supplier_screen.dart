import 'package:flutter/material.dart';
import 'package:harsatapp/widget/custom_appbar.dart';
import 'package:harsatapp/model/supplier.dart';
import 'package:harsatapp/view/supplier/supplier_detail.dart';
import 'package:harsatapp/widget/custom_color.dart';
import 'package:harsatapp/widget/custom_text.dart';

class SupplierScreen extends StatefulWidget {
  List<Supplier> supplier;

  SupplierScreen({Key? key, required this.supplier}) : super(key: key);

  @override
  State<SupplierScreen> createState() => _SupplierScreenState();
}

class _SupplierScreenState extends State<SupplierScreen> {
  final double _shadowOpacity = 0.2;
  late double screenWidth;
  late double screenHeight;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: CustomTopAppBar(),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: (widget.supplier.length / 2).ceil(),
        itemBuilder: (context, index) {
          int firstIndex = index * 2;
          int secondIndex = index * 2 + 1;

          return Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (firstIndex < widget.supplier.length) ...[
                  buildProductCard(firstIndex),
                ],
                const SizedBox(width: 21),
                if (secondIndex < widget.supplier.length) ...[
                  buildProductCard(secondIndex),
                ],
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: CustomBottomAppBar(),
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
                builder: (context) => SupplierDetail(
                      supplierDetail: widget.supplier,
                      indexSupplier: index,
                    )),
          );
        },
        child: Card(
          child: Container(
            width: screenWidth * 0.395,
            height: screenHeight * 0.26,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              boxShadow: [
                BoxShadow(
                  color: CustomColors.mainGrey.withOpacity(_shadowOpacity),
                  offset: const Offset(0, 0),
                  blurRadius: 20.0,
                  spreadRadius: 10.0,
                ),
              ],
              color: CustomColors.mainWhite,
            ),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50, // Yuvarlak resim boyutu
                  backgroundImage: AssetImage(widget.supplier[index].imgPath),
                  backgroundColor: Colors.grey, // Resim dosyasının yolu
                ),
                const SizedBox(height: 10),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: BlackText(
                            text: widget.supplier[index].name,
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
                            text: widget.supplier[index].province,
                            size: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          GreyText(
                            text: widget.supplier[index].city,
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
                  padding: const EdgeInsets.only(right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.star,
                        color: CustomColors.mainOrange,
                      ),
                      ColorText(
                        color: CustomColors.mainOrange,
                        text: '${widget.supplier[index].star}',
                        size: 12,
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
