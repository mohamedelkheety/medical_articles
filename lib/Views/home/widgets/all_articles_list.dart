import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_articles/Views/articles/articles_list.dart';
import 'package:medical_articles/Views/home/widgets/home_category.dart';
import 'package:medical_articles/business%20Logic/ad%20cubit/ad_cubit.dart';
import 'package:medical_articles/data/aqsam_list.dart';
import 'package:medical_articles/data/articles.lists.dart';
import 'package:medical_articles/helper/media_query_size.dart';

class AllArticlesList extends StatelessWidget {
  const AllArticlesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdCubit, AdState>(
      builder: (context, state) {
        return GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: AqsamList.aqsamList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: getCrossAxisCount(context),
          ),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                if (state is InterstitialAdLoaded &&
                    state.interstitialAd != null) {
                  state.interstitialAd?.show();

                  state.interstitialAd = null;
                }
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder:
                        (context) => ArticlesList(
                          index: index,
                          articlesListOfModel:
                              ArticlesLists.allArticlesList[index],
                        ),
                  ),
                );
              },
              child: HomeCategory(
                paddingSize: 4,
                marginSize: 2,
                text: AqsamList.aqsamList[index].title,
                assetName: AqsamList.aqsamList[index].imagePath,
              ),
            );
          },
        );
      },
    );
  }

  int getCrossAxisCount(BuildContext context) {
    int itemCount;

    if (MediaQuerySize.width(context) <= 400) {
      itemCount = 2;
      return itemCount;
    } else if (MediaQuerySize.width(context) <= 600 &&
        MediaQuerySize.width(context) >= 400) {
      itemCount = 3;
      return itemCount;
    } else {
      itemCount = 4;
      return itemCount;
    }
  }
}
