import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';

class ProductReviewDAO {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addProductReviewFromInput(
      String farmerID, String productID) async {
    try {
      print('Puan girin:');
      int rating = int.parse(stdin.readLineSync()!);

      print('Yorum girin:');
      String comment = stdin.readLineSync()!;

      DateTime reviewDate = DateTime.now();

      final reviewRef = _firestore.collection('ProductReviews').doc();

      await reviewRef.set({
        'farmerID': farmerID,
        'productID': productID,
        'rating': rating,
        'comment': comment,
        'reviewDate': reviewDate,
      });

      print('Ürün yorumu başarıyla eklendi.');
    } catch (e) {
      print('Ürün yorumu eklenirken hata oluştu: $e');
    }
  }

  Future<List<Map<String, dynamic>>> getProductReviews(String productID) async {
    try {
      final reviewsSnapshot = await _firestore
          .collection('ProductReviews')
          .where('productID', isEqualTo: productID)
          .get();

      final reviewsDocs = reviewsSnapshot.docs;

      return reviewsDocs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
    } catch (e) {
      print('Ürün yorumları alınırken hata oluştu: $e');
      return [];
    }
  }

  Future<double> getProductAverageRating(String productID) async {
    try {
      final reviewsSnapshot = await _firestore
          .collection('ProductReviews')
          .where('productID', isEqualTo: productID)
          .get();

      final reviewsDocs = reviewsSnapshot.docs;

      if (reviewsDocs.isEmpty) {
        return 0;
      }

      final totalRating = reviewsDocs
          .map((doc) => doc.data()['rating'] as int)
          .reduce((value, element) => value + element);

      final averageRating = totalRating / reviewsDocs.length;

      return averageRating;
    } catch (e) {
      print('Ürünün ortalama puanı alınırken hata oluştu: $e');
      return 0;
    }
  }

  Future<void> deleteProductReview(String reviewID) async {
    try {
      final reviewRef = _firestore.collection('ProductReviews').doc(reviewID);

      await reviewRef.delete();
    } catch (e) {
      print('Ürün yorumu silinirken hata oluştu: $e');
    }
  }
}
