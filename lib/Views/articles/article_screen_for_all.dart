import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_articles/business%20Logic/ad%20cubit/ad_cubit.dart';
import 'package:medical_articles/helper/banner_container.dart';
import 'package:medical_articles/helper/custom_arrow_back.dart';
import 'package:medical_articles/helper/get_responsive_width.dart';
import 'package:medical_articles/models/articles_model.dart';

class ArticleScreenViewForAllArticles extends StatelessWidget {
  const ArticleScreenViewForAllArticles({
    super.key,
    required this.articlesList,
    required this.index,
  });
  final List<ArticlesModel> articlesList;
  final int index;
  @override
  Widget build(BuildContext context) {
    context.read<AdCubit>().loadBannerAd(context: context);

    return Scaffold(
      body: BlocBuilder<AdCubit, AdState>(
        builder: (context, state) {
          return SafeArea(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    right: 8.0,
                    left: 8,
                    bottom: 8,
                  ),
                  child: ListView(
                    children: [
                      Text(
                        textDirection: TextDirection.rtl,
                        articlesList[index].title,
                        style: TextStyle(
                          fontSize: getResponsiveWidth(
                            context,
                            mobileWidth: 0.06,
                            tabletWidth: 22,
                          ),
                        ),
                      ),

                      // Image.asset(widget.articlesList[widget.index].image),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: SelectableText(
                          textAlign: TextAlign.justify,
                          articlesList[index].content,
                          style: TextStyle(
                            fontSize: getResponsiveWidth(
                              context,
                              mobileWidth: 0.055,
                              tabletWidth: 20,
                            ),
                          ),
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                    ],
                  ),
                ),
                                CustomArrowBack(),

                if (state is BannerAdLoaded && state.bannerAd != null)
                  BannerContainer(bannerAd: state.bannerAd),
              ],
            ),
          );
        },
      ),
    );
  }
}
