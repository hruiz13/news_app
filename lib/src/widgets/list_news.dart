import 'package:flutter/material.dart';
import 'package:news_app/src/models/news_models.dart';
import 'package:news_app/src/theme/theme.dart';

class ListNews extends StatelessWidget {
  const ListNews(this.news, {Key? key}) : super(key: key);

  final List<Article> news;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: news.length,
      itemBuilder: (context, index) {
        return _SingleNews(singleNews: news[index], index: index);
      },
    );
  }
}

class _SingleNews extends StatelessWidget {

  const _SingleNews({
    required this.singleNews, 
    required this.index
    });

  final Article singleNews;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _TopCard(singleNews, index),
        _TitleCard(singleNews),
        _ImageCard(singleNews),
        _BodyCard(singleNews),
        _ButtonsCard(),
        const Divider(),
      ]
    );
  }
}

class _ButtonsCard extends StatelessWidget {
  const _ButtonsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RawMaterialButton(
          onPressed: () {},
          fillColor: myTheme.accentColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))
          ),
          child: const Icon(Icons.star_border),
        ),
        const SizedBox(width: 10.0),
        RawMaterialButton(
          onPressed: () {},
          fillColor: Colors.blue,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))
          ),
          child: const Icon(Icons.more),
        ),
      ]
      );
  }
}

class _BodyCard extends StatelessWidget {
  const _BodyCard(this.singleNews, {Key? key}) : super(key: key);

  final Article singleNews;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(singleNews.description ?? ''),
    );
  }
}

class _ImageCard extends StatelessWidget {
  const _ImageCard(this.singleNews);

  final Article singleNews;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          child: singleNews.urlToImage != null
              ? FadeInImage(
                  placeholder: const AssetImage('assets/giphy.gif'),
                  image: NetworkImage(singleNews.urlToImage!),
                )
              : const Image(
                  image: AssetImage('assets/no-image.png'),
                ),
        ),
      ),
    );
  }
}

class _TitleCard extends StatelessWidget {
  const _TitleCard(this.singleNews);

  final Article singleNews;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        singleNews.title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      ),
    );
  }
}

class _TopCard extends StatelessWidget {

  final Article singleNews;
  final int index;

  const _TopCard(this.singleNews, this.index);


  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text('${index+1}.', style: TextStyle(color: myTheme.accentColor)),
        Text('${singleNews.source.name}.', style: TextStyle(color: myTheme.accentColor)),
      ],
    );
  }
}