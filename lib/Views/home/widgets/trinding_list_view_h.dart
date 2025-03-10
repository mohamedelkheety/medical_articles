import 'package:flutter/material.dart';
import 'package:medical_articles/Views/articles/articles_view_body.dart';
import 'package:medical_articles/Views/home/home_page.dart';
import 'package:medical_articles/Views/home/widgets/home_category.dart';
import 'package:medical_articles/data/articles.lists.dart';
import 'package:medical_articles/helper/media_query_size.dart';

class TrindingListViewH extends StatelessWidget {
  const TrindingListViewH({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getResponsiveWidth(context, mobileWidth: 0.5, tabletWidth: 180),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: ArticlesLists.trindingArticale.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return ArticlesViewBody(
                      articlesModel: ArticlesLists.trindingArticale[index],
                    );
                  },
                ),
              );
            },
            child: HomeCategory(
              text: ArticlesLists.trindingArticale[index].title,
              assetName: ArticlesLists.trindingArticale[index].image,
            ),
          );
        },
      ),
    );
  }
}
