import 'dart:convert';

import 'package:api_testing/models/quote_model.dart';
import 'package:http/http.dart' as http;

class QuoteServices {
  var baseUrl = 'https://dummyjson.com/';

  getQuotes() async {
    List<QuoteModel> quoteList = [];
    try {
      var response = await http.get(Uri.parse("${baseUrl}quotes"));
      if (response.statusCode == 200) {
        var data = response.body;
        var decodeData = jsonDecode(data);
        var quotes = decodeData['quotes'];
        for (var quote in quotes) {
          QuoteModel newQuote = QuoteModel.fromJson(quote);
          quoteList.add(newQuote);
        }
      }
    } catch (e) {
      return throw Exception(e.toString());
    }
  }
}
