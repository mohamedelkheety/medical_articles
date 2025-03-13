import 'package:flutter/material.dart';
import 'package:medical_articles/Views/articles/article_screen_for_all.dart';
import 'package:medical_articles/data/aqsam_list.dart';
import 'package:medical_articles/data/articles.lists.dart';
import 'package:medical_articles/helper/get_responsive_width.dart';
import 'package:medical_articles/models/articles_model.dart';

class ArticlesList extends StatelessWidget {
  const ArticlesList({
    super.key,
    required this.articlesListOfModel,
    required this.index,
  });
  final List<ArticlesModel> articlesListOfModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AqsamList.aqsamList[index].title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: getResponsiveWidth(
              context,
              mobileWidth: 0.05,
              tabletWidth: 22,
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: ArticlesLists.allArticlesList[index].length,
        itemBuilder: (context, index) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: ListTile(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return ArticleScreenViewForAllArticles(
                        articlesList: articlesListOfModel,
                        index: index,
                      );
                    },
                  ),
                );
              },
              contentPadding: EdgeInsets.symmetric(horizontal: 6),
              title: Text(
                articlesListOfModel[index].title,
                style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontSize: getResponsiveWidth(
                    context,
                    mobileWidth: 0.05,
                    tabletWidth: 18,
                  ),
                ),
              ),
              subtitle: Text(
                articlesListOfModel[index].content,
                style: TextStyle(
                  overflow: TextOverflow.ellipsis,

                  fontSize: getResponsiveWidth(
                    context,
                    mobileWidth: 0.04,
                    tabletWidth: 16,
                  ),
                  color: Colors.grey.shade500,
                ),
              ),

              // trailing: ClipRRect(
              //   borderRadius: BorderRadius.circular(6),
              //   child: Image.asset(
              //     articlesListOfModel[index].image,
              //     fit: BoxFit.cover,
              //   ),
              // ),
            ),
          );
        },
      ),
    );
  }
}
