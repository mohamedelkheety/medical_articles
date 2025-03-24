class AdIdManger {
  static bool isTest = true;
  static String bannerId =
      isTest
           ?
           "ca-app-pub-3940256099942544/6300978111"
            // "ca-app-pub-3940256099942544/9214589741" 
        //  '/21775744923/example/adaptive-banner'
          : "ca-app-pub-6373031995644201/6035426314"
          ;
  static String interstitialId =
      isTest
          ? '/21775744923/example/interstitial'
          : 'ca-app-pub-6373031995644201/4213942710';
}
