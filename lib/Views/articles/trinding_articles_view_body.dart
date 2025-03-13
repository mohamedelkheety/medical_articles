import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:medical_articles/ad%20manger/ad_id_manger.dart';
import 'package:medical_articles/helper/banner_container.dart';
import 'package:medical_articles/helper/get_responsive_width.dart';
import 'package:medical_articles/models/articles_model.dart';

class TrindingArticlesViewBody extends StatefulWidget {
  const TrindingArticlesViewBody({super.key, required this.articlesModel});
  final ArticlesModel articlesModel;

  @override
  State<TrindingArticlesViewBody> createState() =>
      _TrindingArticlesViewBodyState();
}

class _TrindingArticlesViewBodyState extends State<TrindingArticlesViewBody> {
  BannerAd? bannerAd;
  bool isLoaded = false;
  void loadAd() async {
    final size = await AdSize.getCurrentOrientationAnchoredAdaptiveBannerAdSize(
      MediaQuery.of(context).size.width.truncate(),
    );
    if (size == null) {
      debugPrint("*********************custom size not found");
      return;
    }
bannerAd = BannerAd(
        adUnitId: AdIdManger.bannerId,
        request: const AdRequest(),
        size:size,
        listener: BannerAdListener(
          onAdLoaded: (ad) {
            debugPrint('$ad Loooooaded ');
            setState(() {
              isLoaded = true;
            });
          },
          onAdFailedToLoad: (ad, err) {
            debugPrint('//////////BannerAd failed to load: $err');
              ad.dispose();
            
            

          },
        ),
      )..load();
   
    
  }

  

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loadAd(); // After build context
  }

  @override
  void dispose() {
    bannerAd?.dispose();
    super.dispose();
  }

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
                      widget.articlesModel.title,
                      style: TextStyle(
                        fontSize: getResponsiveWidth(
                          context,
                          mobileWidth: 0.06,
                          tabletWidth: 22,
                        ),
                      ),
                    ),
                     Image.asset(widget.articlesModel.image),
                    SelectableText(
                      textAlign: TextAlign.justify,
                      widget.articlesModel.content,
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
            if (isLoaded && bannerAd != null )
               BannerContainer(bannerAd: bannerAd),
              
         
          ],
        ),
      ),
    );
  }
}
