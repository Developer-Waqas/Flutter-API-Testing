// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:api_testing/models/news_model.dart';
import 'package:http/http.dart' as http;

class NewsServices {
  var baseUrl = 'http://newsapi.org/v2/';

  getNews() async {
    Uri url = Uri.parse(
        "${baseUrl}top-headlines?country=us&category=business&apiKey=f14fbddfc28a44bbb5bffac4833bd7eb");
    var response = await http.get(url);

    try {
      if (response.statusCode == 200) {
        var data = newApiFromJson(response.body);
        return data.articles;
      } else {
        print("Error in connecting to server");
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
