import 'package:flutter/material.dart';
import 'package:medical_articles/helper/get_responsive_width.dart';
import 'package:medical_articles/models/articles_model.dart';

class ArticlesViewBody extends StatefulWidget {
  const ArticlesViewBody({super.key, required this.articlesModel});
  final ArticlesModel articlesModel;

  @override
  State<ArticlesViewBody> createState() => _ArticlesViewBodyState();
}

class _ArticlesViewBodyState extends State<ArticlesViewBody> {


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
                    // if (isLoaded && bannerAd != null)
                    //   BannerContainer(bannerAd: bannerAd),
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
          ],
        ),
      ),
    );
  }
}
