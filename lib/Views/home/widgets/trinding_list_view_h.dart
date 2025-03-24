import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_articles/Views/articles/trinding_articles_view_body.dart';
import 'package:medical_articles/Views/home/widgets/home_category.dart';
import 'package:medical_articles/business%20Logic/ad%20cubit/ad_cubit.dart';
import 'package:medical_articles/data/articles.lists.dart';
import 'package:medical_articles/helper/get_responsive_width.dart';

class TrindingListViewH extends StatelessWidget {
  const TrindingListViewH({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdCubit, AdState>(
      builder: (context, state) {
       
        return SizedBox(
          height: getResponsiveWidth(context, mobileWidth: 0.5, tabletWidth: 180),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: ArticlesLists.trindingArticale.length,
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
                      builder: (context) {
                        return TrindingArticlesViewBody(
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
    );
  }
}
