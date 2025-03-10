import 'package:flutter/material.dart';
import 'package:medical_articles/Views/articles/articles_list.dart';
import 'package:medical_articles/Views/home/home_page.dart';
import 'package:medical_articles/Views/home/widgets/home_category.dart';
import 'package:medical_articles/helper/media_query_size.dart';

class AllArticlesList extends StatelessWidget {
  const AllArticlesList({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: 7,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: MediaQuerySize.width(context) < 400 ? 2 : 3,
      ),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (context) => ArticlesList()));
          },
          child: HomeCategory(
            paddingSize: 4,
            marginSize: 2,
            text: 'الجهاز التنفسي',
            assetName: 'assets/images/articles/ghoda.webp',
          ),
        );
      },
    );
  }
}
