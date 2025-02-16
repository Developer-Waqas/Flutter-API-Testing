import 'package:api_testing/models/news_model.dart';
import 'package:api_testing/services/news_services.dart';
import 'package:flutter/material.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: NewsServices().getNews(),
          builder: (context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              List<Article> articles = snapshot.data;
              return ListView.builder(
                  itemCount: articles.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        leading: Image.network(articles[index].urlToImage),
                        title: Text(articles[index].title),
                        subtitle: Column(
                          children: [
                            Text(articles[index].description),
                            Text(articles[index].content),
                            Text(articles[index].author),
                          ],
                        ),
                        trailing: Text(articles[index].publishedAt.toString()),
                      ),
                    );
                  });
            }
          }),
    );
  }
}
