import 'package:flutter/material.dart';
import 'package:news_app/screens/article_detail_screen.dart';

import '../widget/custom_recommended.dart';

class RecommendedScreen extends StatelessWidget {
  const RecommendedScreen({super.key, required this.articles});

  final List articles;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff004469),
        iconTheme: IconThemeData(color: Colors.white),
        title: Text("Recommended News", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: articles.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : ListView.separated(
          itemBuilder: (context, index) => CustomRecommended(
            title: articles[index].title,
            description: articles[index].description,
            pathImg: articles[index].urlToImage,
            url: '',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>ArticleDetailsScreen(title: articles[index].title, content: articles[index].content, url: articles[index].url)
                ),
              );
            },
          ),
          separatorBuilder: (context, index) =>
          const SizedBox(height: 7),
          itemCount: articles.length,
        ),
      ),
    );
  }
}
