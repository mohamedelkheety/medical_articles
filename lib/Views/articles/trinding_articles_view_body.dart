import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_articles/business%20Logic/ad%20cubit/ad_cubit.dart';
import 'package:medical_articles/helper/banner_container.dart';
import 'package:medical_articles/helper/custom_arrow_back.dart';
import 'package:medical_articles/helper/get_responsive_width.dart';
import 'package:medical_articles/models/articles_model.dart';

class TrindingArticlesViewBody extends StatelessWidget {
  const TrindingArticlesViewBody({super.key, required this.articlesModel});
  final ArticlesModel articlesModel;

  @override
  Widget build(BuildContext context) {
    context.read<AdCubit>().loadBannerAd(context: context);

    return BlocBuilder<AdCubit, AdState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 8.0,
                      left: 8,
                      bottom: 8,
                    ),
                    child: Column(
                      spacing: 5,
                      textDirection: TextDirection.rtl,
                      children: [
                        Text(
                          textDirection: TextDirection.rtl,
                          articlesModel.title,
                          style: TextStyle(
                            fontSize: getResponsiveWidth(
                              context,
                              mobileWidth: 0.06,
                              tabletWidth: 22,
                            ),
                          ),
                        ),
                        Image.asset(articlesModel.image),
                        SelectableText(
                          textAlign: TextAlign.justify,
                          articlesModel.content,
                          style: TextStyle(
                            fontSize: getResponsiveWidth(
                              context,
                              mobileWidth: 0.055,
                              tabletWidth: 20,
                            ),
                          ),
                          textDirection: TextDirection.rtl,
                        ),
                      ],
                    ),
                  ),
                ),
                CustomArrowBack(),

                if (state is BannerAdLoaded && state.bannerAd != null)
                  BannerContainer(bannerAd: state.bannerAd),
              ],
            ),
          ),
        );
      },
    );
  }
}
