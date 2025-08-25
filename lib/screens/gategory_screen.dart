import 'package:flutter/material.dart';
import '../models/news_model.dart';
import '../networking/dio_factory.dart';
import '../widget/custom_recommended.dart';
import 'article_detail_screen.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key, required this.title});
final String title;

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<ArticleModel> articles = [];
  @override
  void initState() {
    super.initState();
    fetchArticles(widget.title.toLowerCase());
  }

  void fetchArticles(String query) async {
    final result = await DioFactory.getData(query);
    setState(() {
      articles = result;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.white
        ),
        title: Text(widget.title,style: TextStyle(color: Colors.white),),
        backgroundColor: Color(0xff2d4a65),
      ),
      body: Column(
        children: [
          Expanded(
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
        ],
      ),
    );
  }
}
