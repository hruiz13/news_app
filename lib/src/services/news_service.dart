import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/src/models/category_model.dart';
import 'package:news_app/src/models/news_models.dart';
import 'package:http/http.dart' as http;

class NewsService with ChangeNotifier{

  List<Article> headlines = [];
  String _selectedCategory = 'business';

  List<Category> categories = [
    Category( Icons.public, 'general' ),
    Category( FontAwesomeIcons.building, 'business' ),
    Category( FontAwesomeIcons.tv, 'entertainment' ),
    Category( FontAwesomeIcons.headSideVirus, 'health' ),
    Category( FontAwesomeIcons.vials, 'science' ),
    Category( FontAwesomeIcons.volleyball, 'sports' ),
    Category( FontAwesomeIcons.memory, 'technology' ),
  ];

  Map<String, List<Article>> categoryArticles = {};

  final _urlNews = 'https://newsapi.org/v2';
  final _apiKey = 'd5ebffb6705e433aa36267d1d83f7bb6';

  NewsService(){
    getTopHeadlines();
    for (var item in categories) {
      categoryArticles[item.name] = [];
    }
  }

  String get selectedCategory => _selectedCategory;

  set selectedCategory(String valor){
    _selectedCategory = valor;
    fetchArticlesByCategory(valor);
    notifyListeners();
  }

  List<Article> get getArticlesByCategory => categoryArticles[_selectedCategory]!;

  getTopHeadlines() async{
    final url = Uri.parse('$_urlNews/top-headlines?apiKey=$_apiKey&country=co');
    final resp = await http.get(url);

    final newsResponse = newsModelFromJson(resp.body);

    headlines.addAll(newsResponse.articles);
    notifyListeners();
  }

  fetchArticlesByCategory(String category) async{
    if (categoryArticles[category]!.length > 0) {
      return categoryArticles[category];
    }
    final url = Uri.parse('$_urlNews/top-headlines?apiKey=$_apiKey&country=co&category=$category');
    final resp = await http.get(url);

    final newsResponse = newsModelFromJson(resp.body);

    categoryArticles[category]!.addAll(newsResponse.articles);

    notifyListeners();
  }
}