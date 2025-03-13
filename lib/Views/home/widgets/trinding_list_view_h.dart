import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:medical_articles/Views/articles/trinding_articles_view_body.dart';
import 'package:medical_articles/Views/home/widgets/home_category.dart';
import 'package:medical_articles/ad%20manger/ad_id_manger.dart';
import 'package:medical_articles/data/articles.lists.dart';
import 'package:medical_articles/helper/get_responsive_width.dart';

class TrindingListViewH extends StatefulWidget {
  const TrindingListViewH({super.key});

  @override
  State<TrindingListViewH> createState() => _TrindingListViewHState();
}

class _TrindingListViewHState extends State<TrindingListViewH> {
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
    return SizedBox(
      height: getResponsiveWidth(context, mobileWidth: 0.5, tabletWidth: 180),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: ArticlesLists.trindingArticale.length,
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
}
