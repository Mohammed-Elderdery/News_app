import 'package:flutter/material.dart';
import 'package:news_cloud_app/core/conistant.dart';
import 'package:news_cloud_app/services/news_api.dart';

import '../models/article_model.dart';

NewsApi newsApi = NewsApi();

class ScrollWidget extends StatefulWidget {
  const ScrollWidget({super.key});

  @override
  State<ScrollWidget> createState() => _ScrollWidgetState();
}

class _ScrollWidgetState extends State<ScrollWidget> {
  @override
  void initState() {
    getNews();
    super.initState();
  }

  getNews() async {
    news = await newsApi.fetchData();
  }

  List<Article> news = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: AppBar(
        backgroundColor: kMainColor,
        centerTitle: true,
        title: Text(
          "News ",
          style:
              TextStyle(fontWeight: FontWeight.normal, color: kSecondaryColor),
        ),
        leading: Icon(
          Icons.menu,
          color: kSecondaryColor,
        ),
        actions: [
          Icon(
            Icons.search,
            color: kSecondaryColor,
          ),
          const SizedBox(
            width: 20,
          ),
          Icon(
            Icons.more_vert_sharp,
            color: kSecondaryColor,
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: news.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          height: 300,
                          width: double.infinity,
                          // constraints: const BoxConstraints(maxWidth: 120, maxHeight: 100),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 10,
                                spreadRadius: 3,
                                offset: const Offset(0, 3),
                                color: Colors.grey.withOpacity(0.2),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                constraints: const BoxConstraints(
                                    maxWidth: double.infinity / 2),
                                child: Text(
                                  news[index].title,
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
