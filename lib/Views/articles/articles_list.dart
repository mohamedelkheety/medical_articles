import 'package:flutter/material.dart';
import 'package:medical_articles/Views/home/home_page.dart';

class ArticlesList extends StatelessWidget {
  const ArticlesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Articles List',
          style: TextStyle(
            fontWeight: FontWeight.bold,
             fontSize: getResponsiveWidth(
              context,
              mobileWidth: 0.06,
              tabletWidth: 22,
            ), ),
        ),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 6),
              title: Text(
                ' خروج دم مع البلغم: الأسباب وكيفية علاجه',
                style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                    fontSize: getResponsiveWidth(
                    context,
                    mobileWidth: 0.05,
                    tabletWidth: 18,
                  ), ),
              ),
              subtitle: Text(
                'علامات الربو غير المسيطر عليه منها:البلغم الاخضر والعال الديكي',
                style: TextStyle(
                  overflow: TextOverflow.ellipsis,

                   fontSize: getResponsiveWidth(
                    context,
                    mobileWidth: 0.04,
                    tabletWidth: 16,
                  ), color: Colors.grey.shade500,
                ),
              ),

              trailing: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.asset(
                  'assets/images/articles/الصحة النفسية.webp',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
