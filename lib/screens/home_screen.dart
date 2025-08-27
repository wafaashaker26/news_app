import 'package:flutter/material.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/screens/article_detail_screen.dart';
import 'package:news_app/screens/recommended_screen.dart';
import 'package:news_app/widget/custom_card.dart';
import 'package:news_app/widget/custom_recommended.dart';
import '../networking/dio_factory.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var searchController=TextEditingController();
  List<ArticleModel> articles = [];
  List<CustomCard> list = [
    CustomCard(title: "Medicine"),
    CustomCard(title: "Science"),
    CustomCard(title: "Technology"),
    CustomCard(title: "Sports"),
    CustomCard(title: "Gaming"),
    CustomCard(title: "Animals"),
    CustomCard(title: "Plants"),
    CustomCard(title: "Art"),
    CustomCard(title: "Food"),
    CustomCard(title: "Fashion"),
    CustomCard(title: "History"),
  ];

  @override
  void initState() {
    super.initState();
    fetchArticles("Random");
  }
  @override
  void dispose(){
    super.dispose();
    searchController.dispose();
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  "assets/images/hello.png",
                  height: MediaQuery.sizeOf(context).height * .25,
                ),
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: searchController,
                keyboardType: TextInputType.text,
                onFieldSubmitted: (value) {
                  fetchArticles(value);
                },
                decoration: InputDecoration(
                  hintText: "Search",
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 45,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => list[index],
                  separatorBuilder: (context, index) =>
                  const SizedBox(width: 5),
                  itemCount: list.length,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Recommended for you",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              RecommendedScreen(articles: articles),
                        ),
                      );
                    },
                    child: const Text(
                      "See All",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff2d4a65),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              Expanded(
                child: articles.isEmpty
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.separated(
                  itemBuilder: (context, index) => CustomRecommended(
                    title: articles[index].title,
                    description: articles[index].description,
                    pathImg: articles[index].urlToImage,
                    url: articles[index].url,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ArticleDetailsScreen(
                            title: articles[index].title,
                            content: articles[index].content,
                            url: articles[index].url,
                          ),
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
        ),
      ),
    );
  }
}
