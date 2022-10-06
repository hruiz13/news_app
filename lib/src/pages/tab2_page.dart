import 'package:flutter/material.dart';
import 'package:news_app/src/models/category_model.dart';
import 'package:news_app/src/services/news_service.dart';
import 'package:news_app/src/widgets/list_news.dart';
import 'package:provider/provider.dart';

class Tab2Screen extends StatelessWidget {
   
  const Tab2Screen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            _CategoryList(),
            Expanded(
              child: ListNews( newsService.getArticlesByCategory )
            ),

          ],
        )
      )
    );
  }
}

class _CategoryList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final categories = Provider.of<NewsService>(context).categories;

    return SizedBox(
      width: double.infinity,
      height: 80,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index){
          return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  _CategoryButton(categories[index]),
                  const SizedBox(height: 5),
                  Text('${categories[index].name[0].toUpperCase()}${categories[index].name.substring(1)}')
                ],
              ),
            );
        },
      ),
    );
  }
}

class _CategoryButton extends StatelessWidget {
  const _CategoryButton(this.category);

  final Category category;

  @override
  Widget build(BuildContext context) {
    final newService = Provider.of<NewsService>(context, listen: false);
    return GestureDetector(
      onTap: () {
        newService.selectedCategory = category.name;
      },
      child: Container(
        width: 40,
        height: 40,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white
        ),
        child: Icon(
          category.icon,
          color: newService.selectedCategory == category.name 
          ? Colors.red
          : Colors.black54,

        )
      ),
    );
  }
}