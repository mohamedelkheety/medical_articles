import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:medical_articles/Views/articles/articles_list.dart';
import 'package:medical_articles/Views/home/widgets/home_category.dart';
import 'package:medical_articles/ad%20manger/ad_id_manger.dart';
import 'package:medical_articles/data/aqsam_list.dart';
import 'package:medical_articles/data/articles.lists.dart';
import 'package:medical_articles/helper/media_query_size.dart';

class AllArticlesList extends StatefulWidget {
  const AllArticlesList({super.key});

  @override
  State<AllArticlesList> createState() => _AllArticlesListState();
}

class _AllArticlesListState extends State<AllArticlesList> {
   InterstitialAd? interstitialAd;
  bool interstitialIsLoaded = false;
  void loadAd() {
    InterstitialAd.load(
      adUnitId: AdIdManger.interstitialId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          debugPrint('InterstitialAd Loaded');
          setState(() {
            interstitialAd = ad;
            interstitialIsLoaded = true;
          });
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              ad.dispose();
              loadAd(); // تحميل إعلان جديد بعد إغلاق الإعلان الحالي
            },
            onAdFailedToShowFullScreenContent: (ad, error) {
              ad.dispose();
              setState(() {
                interstitialAd = null;
                interstitialIsLoaded = false;
              });
            },
          );
        },
        onAdFailedToLoad: (LoadAdError error) {
          debugPrint('InterstitialAd failed to load: $error');
          setState(() {
            interstitialIsLoaded = false;
          });
        },
      ),
    );
  }

  @override
  void initState() {
    loadAd();

    super.initState();
  }

  @override
  void dispose() {
    interstitialAd?.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
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
             if (interstitialIsLoaded && interstitialAd != null) {
              interstitialAd?.show();
              interstitialIsLoaded = false;
              interstitialAd = null;
            }
            Navigator.of(context).push(
              MaterialPageRoute(
                builder:
                    (context) => ArticlesList(
                      index: index,
                      articlesListOfModel: ArticlesLists.allArticlesList[index],
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
