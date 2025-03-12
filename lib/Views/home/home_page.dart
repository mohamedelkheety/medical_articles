import 'package:flutter/material.dart';
import 'package:medical_articles/Views/home/widgets/all_articles_list.dart';
import 'package:medical_articles/Views/home/widgets/custom_text_home.dart';
import 'package:medical_articles/Views/home/widgets/drawer_widget.dart';
import 'package:medical_articles/Views/home/widgets/trinding_list_view_h.dart';
import 'package:medical_articles/helper/get_responsive_width.dart';

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
