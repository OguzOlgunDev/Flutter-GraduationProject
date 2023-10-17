import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreDatabaseHelper {
  final CollectionReference productsRef =
      FirebaseFirestore.instance.collection('Products');
  final CollectionReference productReviewsRef =
      FirebaseFirestore.instance.collection('ProductReviews');

  Future<void> createTables() async {
    // Create Products table
    await productsRef.add({
      'productID': null, // Auto-generated
      'supplierID': '', // Reference to Supplier
      'productName': '',
      'productCategory': '', // Reference to ProductCategory
      'price': null,
      'stock': null,
      'productDetails': '',
      'productUnit': '',
    });

    // Create ProductReviews table
    await productReviewsRef.add({
      'productReviewID': null, // Auto-generated
      'farmerID': '', // Reference to Farmers
      'productID': '', // Reference to Products
      'rating': null,
      'comment': '',
      'reviewDate': null,
    });
  }
}
