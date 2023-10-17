import 'package:flutter/material.dart';
import 'package:harsatapp/widget/custom_appbar.dart';
import 'package:harsatapp/model/news.dart';
import 'news_detail.dart';
import 'package:harsatapp/widget/custom_color.dart';
import 'package:harsatapp/widget/custom_text.dart';

class NewsScreen extends StatelessWidget {
  List<News> news;
  NewsScreen({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(64),
        child: CustomTopAppBar(),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: news.length,
          itemBuilder: (context, index) {
            String shortDesc = news[index].desc;
            if (shortDesc.length > 150) {
              shortDesc = shortDesc.substring(0, 130) + '...';
            }
            return GestureDetector(
              onTap: () {
                // Navigate to detail page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        NewsDetail(indexNews: index, newsDetail: news),
                  ),
                );
              },
              child: Container(
                margin: EdgeInsets.all(10),
                child: Card(
                  elevation: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: CustomColors.mainGrey, width: 1.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 30, right: 30, top: 30, bottom: 10),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.asset(
                              news[index].imgPath,
                              width: screenWidth - 20,
                              height: 200,
                            ),
                          ),
                          SizedBox(height: 15),
                          BlackText(
                            text: news[index].name,
                            size: 20,
                            fontWeight: FontWeight.w400,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 10),
                          GreyText(
                            text: shortDesc,
                            size: 16,
                            fontWeight: FontWeight.w400,
                            textAlign: TextAlign.justify,
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              BlackText(
                                text: news[index].date,
                                size: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: CustomBottomAppBar(),
    );
  }
}
