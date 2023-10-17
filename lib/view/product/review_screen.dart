import 'package:flutter/material.dart';
import 'package:harsatapp/model/review.dart';
import 'package:harsatapp/view/product/review_list.dart';
import 'package:harsatapp/widget/custom_color.dart';
import 'package:harsatapp/widget/custom_text.dart';
import 'package:harsatapp/widget/custom_appbar.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTopAppBar2(),
      body: ReviewList(
        review: Review.generateReview(),
      ),
      bottomNavigationBar: CustomBottomAppBar(),
    );
  }
}
