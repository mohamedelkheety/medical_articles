import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:medical_articles/ad%20manger/ad_id_manger.dart';

part 'ad_state.dart';

class AdCubit extends Cubit<AdState> {
  AdCubit() : super(AdInitial());

  BannerAd? bannerAd;
  void loadBannerAd({required BuildContext context}) async {
    final size = await AdSize.getCurrentOrientationAnchoredAdaptiveBannerAdSize(
      MediaQuery.of(context).size.width.truncate(),
    );
    if (size == null) {
      debugPrint("custom size not found");
      return;
    }

    bannerAd = BannerAd(
      adUnitId: AdIdManger.bannerId,
      request: const AdRequest(),
      size: size,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          debugPrint('$ad Loooooaded ');

          emit(BannerAdLoaded(bannerAd: bannerAd));
        },
        onAdFailedToLoad: (ad, err) {
          debugPrint('//////////BannerAd failed to load*************: $err');
          ad.dispose();
          emit(AdFailed());
        },
      ),
    )..load();
  }
   InterstitialAd? interstitialAd;
  void loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: AdIdManger.interstitialId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          debugPrint('InterstitialAd Loaded');
            interstitialAd = ad;
          emit(InterstitialAdLoaded(interstitialAd: interstitialAd));
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              ad.dispose();
              loadInterstitialAd(); // تحميل إعلان جديد بعد إغلاق الإعلان الحالي
            },
            onAdFailedToShowFullScreenContent: (ad, error) {
              ad.dispose();
              
                interstitialAd = null;
               
            },
          );
        },
        onAdFailedToLoad: (LoadAdError error) {
          debugPrint('InterstitialAd failed to load: $error');
         
        },
        
      ),
    );
  }

}
