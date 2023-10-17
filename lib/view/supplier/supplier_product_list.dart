// import 'package:flutter/material.dart';
// import 'package:harsat_demo/Model/supplier.dart';
//
// class SupplierProductList extends StatelessWidget {
//
//   final List<Supplier> supplierDetail;
//   int indexSupplier;
//   SupplierProductList({Key? key, required this.supplierDetail, required this.indexSupplier}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: ListView.builder(
//         itemCount: supplierDetail.length,
//         itemBuilder: (context, index) {
//           return GestureDetector(
//             onTap: () {
//               // Navigate to detail page
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => SupplierDetail(supplierDetail: supplier, indexSupplier: index),
//                 ),
//               );
//             },
//             child: Container(
//               margin: EdgeInsets.all(20),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(8),
//                 child: Card(
//                   elevation: 4,
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Row(
//                       children: [
//                         CircleAvatar(
//                           radius: 50, // Yuvarlak resim boyutu
//                           backgroundImage: AssetImage(supplier[index].imgPath),
//                           backgroundColor: Colors.grey,// Resim dosyasının yolu
//                         ),
//                         Expanded(
//                           child: Column(
//                             children: [
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Text(supplier[index].name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)
//                                 ],
//                               ),
//                               SizedBox(
//                                 height: 10,
//                               ),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                 children: [
//                                   Text(supplier[index].province),
//                                   Text(supplier[index].city)
//                                 ],
//                               ),
//                               SizedBox(
//                                 height: 10,
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
