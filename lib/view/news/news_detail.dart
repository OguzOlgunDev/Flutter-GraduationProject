import 'package:flutter/material.dart';
import 'package:harsatapp/widget/custom_appbar.dart';
import 'package:harsatapp/model/news.dart';
import 'package:harsatapp/widget/custom_color.dart';
import 'package:harsatapp/widget/custom_text.dart';

class NewsDetail extends StatelessWidget {
  final List<News> newsDetail;
  final indexNews;
  const NewsDetail({Key? key, required this.newsDetail, this.indexNews})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(64),
        child: CustomTopAppBar(),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  newsDetail[indexNews].imgPath,
                  width: screenWidth - 20,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  BlackText(
                    text: newsDetail[indexNews].date,
                    size: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
              SizedBox(height: 10),
              BlackText(
                text: newsDetail[indexNews].name,
                size: 20,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              GreyText2(
                text: newsDetail[indexNews].desc,
                size: 16,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomAppBar(),
    );
  }
}
