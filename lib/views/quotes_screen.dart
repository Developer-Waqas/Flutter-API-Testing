import 'package:api_testing/models/quote_model.dart';
import 'package:api_testing/services/quote_services.dart';
import 'package:flutter/material.dart';

class QuotesScreen extends StatelessWidget {
  const QuotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quotes Screen'),
        backgroundColor: Colors.yellowAccent,
      ),
      body: FutureBuilder(
        future: QuoteServices().getQuotes(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          } else if (snapshot.hasData) {
            var data = snapshot.data as List<QuoteModel>;
            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(data[index].auther!),
                    subtitle: Text(data[index].quote!),
                    trailing: Text(data[index].id.toString()),
                  );
                });
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.yellowAccent,
              ),
            );
          }
        },
      ),
    );
  }
}
