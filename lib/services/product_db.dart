import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:harsatapp/services/review_db.dart';

class ProductDAO {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addProduct({
    required String supplierID,
    required String supplierName,
    required String productName,
    required String productCategory,
    required double price,
    required int stock,
    required String productDetails,
    required String productUnit,
    required String imgPath,
  }) async {
    try {
      final productRef = _firestore.collection('Products').doc();

      await productRef.set({
        'supplierID': supplierID,
        'supplierName': supplierName,
        'productName': productName,
        'productCategory': productCategory,
        'price': price,
        'stock': stock,
        'productDetails': productDetails,
        'productUnit': productUnit,
        'imgPath': imgPath,
      });
    } catch (e) {
      print('Ürün eklenirken hata oluştu: $e');
    }
  }

  Future<List<Map<String, dynamic>>> getAllProducts() async {
    try {
      final productsSnapshot = await _firestore.collection('Products').get();

      final productsDocs = productsSnapshot.docs;

      return productsDocs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
    } catch (e) {
      print('Ürünler alınırken hata oluştu: $e');
      return [];
    }
  }

  Future<List<Map<String, dynamic>>> getProductsBySupplier(
      String supplierID) async {
    try {
      final productsSnapshot = await _firestore
          .collection('Products')
          .where('supplierID', isEqualTo: supplierID)
          .get();

      final productsDocs = productsSnapshot.docs;

      return productsDocs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
    } catch (e) {
      print('Tedarikçiye ait ürünler alınırken hata oluştu: $e');
      return [];
    }
  }

  Future<Map<String, dynamic>?> getProductByID(String productID) async {
    try {
      final productSnapshot =
          await _firestore.collection('Products').doc(productID).get();

      return productSnapshot.data() as Map<String, dynamic>?;
    } catch (e) {
      print('Ürün alınırken hata oluştu: $e');
      return null;
    }
  }

  Future<void> updateProductName(
      String productID, String? newProductName) async {
    try {
      final productRef = _firestore.collection('Products').doc(productID);

      await productRef.update({
        'productName': newProductName,
      });
    } catch (e) {
      print('Ürün adı güncellenirken hata oluştu: $e');
    }
  }

  Future<void> updateProductPrice(String productID, double? newPrice) async {
    try {
      final productRef = _firestore.collection('Products').doc(productID);

      await productRef.update({
        'price': newPrice,
      });
    } catch (e) {
      print('Ürün fiyatı güncellenirken hata oluştu: $e');
    }
  }

  Future<void> updateProductStock(String productID, int? newStock) async {
    try {
      final productRef = _firestore.collection('Products').doc(productID);

      await productRef.update({
        'stock': newStock,
      });
    } catch (e) {
      print('Ürün stok güncellenirken hata oluştu: $e');
    }
  }

  Future<void> updateProductDetails(
      String productID, String? newProductDetails) async {
    try {
      final productRef = _firestore.collection('Products').doc(productID);

      await productRef.update({
        'productDetails': newProductDetails,
      });
    } catch (e) {
      print('Ürün detayları güncellenirken hata oluştu: $e');
    }
  }

  Future<void> updateProductUnit(
      String productID, String? newProductUnit) async {
    try {
      final productRef = _firestore.collection('Products').doc(productID);

      await productRef.update({
        'productUnit': newProductUnit,
      });
    } catch (e) {
      print('Ürün birimi güncellenirken hata oluştu: $e');
    }
  }

  Future<void> deleteProduct(String productID) async {
    try {
      final productRef = _firestore.collection('Products').doc(productID);

      await productRef.delete();
    } catch (e) {
      print('Ürün silinirken hata oluştu: $e');
    }
  }
}
