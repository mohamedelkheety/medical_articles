import 'package:flutter/material.dart';
import 'package:medical_articles/helper/get_responsive_width.dart';
import 'package:medical_articles/models/articles_model.dart';

class ArticleScreenViewForAllArticles extends StatefulWidget {
  const ArticleScreenViewForAllArticles({super.key, required this.articlesList, required this.index});
  final List <ArticlesModel> articlesList;
  final int index;

  @override
  State<ArticleScreenViewForAllArticles> createState() => _AllArticlesViewBodyState();
}

class _AllArticlesViewBodyState extends State<ArticleScreenViewForAllArticles> {
  // BannerAd? bannerAd;
  // bool isLoaded = false;
  // void loadAd() async {
  //   final size = await AdSize.getCurrentOrientationAnchoredAdaptiveBannerAdSize(
  //     MediaQuery.of(context).size.width.truncate(),
  //   );
  //   if (size == null) {
  //     debugPrint("custom size not found");
  //     return;
  //   }
  //   bannerAd = BannerAd(
  //     adUnitId: AdManager.bannerId,
  //     request: const AdRequest(),
  //     size: size,
  //     listener: BannerAdListener(
  //       onAdLoaded: (ad) {
  //         debugPrint('$ad Loooooaded ');
  //         setState(() {
  //           isLoaded = true;
  //         });
  //       },
  //       onAdFailedToLoad: (ad, err) {
  //         debugPrint('//////////BannerAd failed to load: $err');
  //         ad.dispose();
  //       },
  //     ),
  //   )..load();
  // }

  // // @override
  // // void initState() {
  // //   loadAd();
  // //   super.initState();
  // // }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   loadAd(); // After build context
  // }

  // @override
  // void dispose() {
  //   bannerAd?.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0, left: 8, bottom: 8),
                child: Column(
                  spacing: 5,
                  textDirection: TextDirection.rtl,
                  children: [
                    Text(
                      textDirection: TextDirection.rtl,
                      widget.articlesList[widget.index].title,
                      style: TextStyle(
                        fontSize: getResponsiveWidth(
                          context,
                          mobileWidth: 0.06,
                          tabletWidth: 22,
                        ),
                      ),
                    ),
                    // if (isLoaded && bannerAd != null)
                    //   BannerContainer(bannerAd: bannerAd),
                    // Image.asset(widget.articlesList[widget.index].image),
                    SelectableText(
                      textAlign: TextAlign.justify,
                      widget.articlesList[widget.index].content,
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Icon(Icons.arrow_back_ios),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
