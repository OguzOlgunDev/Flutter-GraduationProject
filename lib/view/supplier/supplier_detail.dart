import 'package:flutter/material.dart';
import 'package:harsatapp/view/product/product_detail.dart';
import 'package:harsatapp/widget/custom_color.dart';
import 'package:harsatapp/widget/custom_text.dart';
import 'package:harsatapp/widget/custom_appbar.dart';
import 'package:harsatapp/model/supplier.dart';
import 'package:harsatapp/view/supplier/supplier_detail.dart';

class SupplierDetail extends StatelessWidget {
  final List<Supplier> supplierDetail;
  int indexSupplier;
  SupplierDetail(
      {Key? key, required this.supplierDetail, required this.indexSupplier})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(64),
        child: CustomTopAppBar2(),
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 15, top: 15, left: 5, right: 5),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 50, // Yuvarlak resim boyutu
                      backgroundImage:
                          AssetImage(supplierDetail[indexSupplier].imgPath),
                      backgroundColor: Colors.grey, // Resim dosyasının yolu
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BlackText(
                                  text: supplierDetail[indexSupplier].name,
                                  size: 28,
                                  fontWeight: FontWeight.w500),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GreyText(
                                  text: supplierDetail[indexSupplier].province +
                                      "/" +
                                      supplierDetail[indexSupplier].city,
                                  size: 20,
                                  fontWeight: FontWeight.w400),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: CustomColors.mainOrange,
                                  ),
                                  ColorText(
                                    color: CustomColors.mainOrange,
                                    text:
                                        '${supplierDetail[indexSupplier].star}',
                                    size: 12,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8, left: 8),
                child: Column(
                  children: [
                    GreyText2(
                      text: supplierDetail[indexSupplier].desc,
                      size: 16,
                      fontWeight: FontWeight.w400,
                      textAlign: TextAlign.justify,
                    )
                  ],
                ),
              ),
              SizedBox(height: 12),
              //******************************************************** Burası farklı bir classta yazılacak *********************
              Expanded(
                child: Container(
                  child: ListView.builder(
                    itemCount:
                        supplierDetail[indexSupplier].productsTohum.length +
                            supplierDetail[indexSupplier].productsGubre.length +
                            supplierDetail[indexSupplier].productsIlac.length,
                    itemBuilder: (context, index) {
                      if (index <
                          supplierDetail[indexSupplier].productsTohum.length) {
                        // Tohum kategorisi için
                        if (supplierDetail[indexSupplier].name ==
                            supplierDetail[indexSupplier]
                                .productsTohum[index]
                                .bayi) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductDetail(
                                    productDetail: supplierDetail[indexSupplier]
                                        .productsTohum,
                                    indexProduct: index,
                                  ),
                                ),
                              );
                            },
                            child: buildProductCard(indexSupplier, index,
                                category: "tohum"),
                          );
                        }
                      } else if (index <
                          supplierDetail[indexSupplier].productsTohum.length +
                              supplierDetail[indexSupplier]
                                  .productsGubre
                                  .length) {
                        // Gübre kategorisi için
                        int gubreIndex = index -
                            supplierDetail[indexSupplier].productsTohum.length;
                        if (supplierDetail[indexSupplier].name ==
                            supplierDetail[indexSupplier]
                                .productsGubre[gubreIndex]
                                .bayi) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductDetail(
                                    productDetail: supplierDetail[indexSupplier]
                                        .productsGubre,
                                    indexProduct: gubreIndex,
                                  ),
                                ),
                              );
                            },
                            child: buildProductCard(indexSupplier, gubreIndex,
                                category: "gübre"),
                          );
                        }
                      } else {
                        // İlaç kategorisi için
                        int ilacIndex = index -
                            supplierDetail[indexSupplier].productsTohum.length -
                            supplierDetail[indexSupplier].productsGubre.length;
                        if (supplierDetail[indexSupplier].name ==
                            supplierDetail[indexSupplier]
                                .productsIlac[ilacIndex]
                                .bayi) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductDetail(
                                    productDetail: supplierDetail[indexSupplier]
                                        .productsIlac,
                                    indexProduct: ilacIndex,
                                  ),
                                ),
                              );
                            },
                            child: buildProductCard(indexSupplier, ilacIndex,
                                category: "ilaç"),
                          );
                        }
                      }

                      // Return an empty Container or null if the condition is not met
                      return Container();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomAppBar(),
    );
  }

  Widget buildProductCard(int indexSupplier, int index,
      {String category = "tohum"}) {
    String quality;
    String bayi;
    String province;

    switch (category) {
      case "tohum":
        quality = supplierDetail[indexSupplier].productsTohum[index].name;
        bayi = supplierDetail[indexSupplier].productsTohum[index].bayi;
        province = supplierDetail[indexSupplier].productsTohum[index].province;
        break;
      case "gübre":
        quality = supplierDetail[indexSupplier].productsGubre[index].name;
        bayi = supplierDetail[indexSupplier].productsGubre[index].bayi;
        province = supplierDetail[indexSupplier].productsGubre[index].province;
        break;
      case "ilaç":
        quality = supplierDetail[indexSupplier].productsIlac[index].name;
        bayi = supplierDetail[indexSupplier].productsIlac[index].bayi;
        province = supplierDetail[indexSupplier].productsIlac[index].province;
        break;
      default:
        quality = "";
        bayi = "";
        province = "";
    }

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: CustomColors.mainGrey,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      margin: EdgeInsets.fromLTRB(10, 8, 10, 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Card(
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 45,
                  backgroundImage:
                      AssetImage(_getImagePath(indexSupplier, index, category)),
                  backgroundColor: Colors.grey,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BlackText(
                              text: quality,
                              size: 18,
                              fontWeight: FontWeight.w500)
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GreyText(
                            text: bayi,
                            size: 16,
                            fontWeight: FontWeight.w400,
                          ),
                          GreyText(
                            text: province,
                            size: 16,
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

  String _getImagePath(int indexSupplier, int index, String category) {
    switch (category) {
      case "tohum":
        return supplierDetail[indexSupplier].productsTohum[index].imgPath;
      case "gübre":
        return supplierDetail[indexSupplier].productsGubre[index].imgPath;
      case "ilaç":
        return supplierDetail[indexSupplier].productsIlac[index].imgPath;
      default:
        return ""; // Varsayılan olarak boş dizgi döndürülür
    }
  }
}
