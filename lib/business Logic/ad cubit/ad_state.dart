part of 'ad_cubit.dart';
abstract class AdState {}

 class AdInitial extends AdState {}
 class BannerAdLoaded extends AdState {
    BannerAd? bannerAd;

  BannerAdLoaded({required this.bannerAd});

 }
 class AdFailed extends AdState {}

class InterstitialAdLoaded extends AdState {
     InterstitialAd? interstitialAd;

  InterstitialAdLoaded({required this.interstitialAd});

}
