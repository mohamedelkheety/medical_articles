import 'package:flutter/material.dart';
import 'package:medical_articles/Views/home/widgets/all_articles_list.dart';
import 'package:medical_articles/Views/home/widgets/drawer_widget.dart';
import 'package:medical_articles/Views/home/widgets/trinding_list_view_h.dart';
import 'package:medical_articles/helper/media_query_size.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Medical Articles',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: getResponsiveWidth(
              context,
              mobileWidth: 0.06,
              tabletWidth: 22,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: TrindingListViewH()),
            SliverToBoxAdapter(child: CustomTextHome()),
            SliverToBoxAdapter(child: AllArticlesList()),
          ],
        ),
      ),
    );
  }
}

class CustomTextHome extends StatelessWidget {
  const CustomTextHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,

      child: Text(
        "جميع المقالات",
        textDirection: TextDirection.rtl,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: getResponsiveWidth(
            context,
            mobileWidth: 0.05,
            tabletWidth: 20,
          ),
        ),
      ),
    );
  }
}

getResponsiveWidth(
  BuildContext context, {
  required double mobileWidth,
  required double tabletWidth,
}) {
  if (MediaQuerySize.width(context) > 400) {
    return tabletWidth;
  } else {
    return MediaQuerySize.width(context) * mobileWidth;
  }
}
