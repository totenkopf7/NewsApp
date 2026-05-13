import 'dart:convert';
import 'package:http/http.dart' as http;
import "package:newsapp/models/news_model.dart";

class NewsService {
  Future<List<NewsModel>> fetchNews() async {
    const url = "http://192.168.100.2:5000/news";

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final articles = data['articles'] as List;
        return articles.map((e) => NewsModel.fromJson(e)).toList();
      } else {
        throw Exception("Failed: ${response.statusCode}");
      }
    } catch (e) {
      print("Error: $e");
      throw Exception("Error loading news");
    }
  }
}
