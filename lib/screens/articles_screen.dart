import 'package:flutter/material.dart';
import 'package:news_cloud_app/services/news_api.dart';

class ScrollWidget extends StatelessWidget {
  const ScrollWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: ElevatedButton(
            onPressed: () async {
              NewsApi newsApi = NewsApi();
              var articles = await newsApi.fetchData();
              for (var article in articles) {
                print(article.title);
              }
            },
            child: const Text("Press Me"),
          ),
        ),
      ),
    );
  }
}
