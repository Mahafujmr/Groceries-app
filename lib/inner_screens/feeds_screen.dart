import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../services/utils.dart';
import '../widgets/feed_items.dart';
import '../widgets/text_widget.dart';

class FeedsScreen extends StatefulWidget {
  static const routeName = "/FeedsScreenState";
  const FeedsScreen({super.key});

  @override
  State<FeedsScreen> createState() => _FeedsScreenState();
}

class _FeedsScreenState extends State<FeedsScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    final Color color = Utils(context).color;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            IconlyLight.arrowLeft2,
            color: color,
          ),
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        title: TextWidget(
          text: 'All products',
          color: color,
          textSize: 24.0,
          isTitle: true,
        ),
      ),
      body: Column(
        children: [
          GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: 2,
            padding: EdgeInsets.zero,
            // crossAxisSpacing: 10,
            childAspectRatio: size.width / (size.height * 0.7),
            children: List.generate(4, (index) {
              return const FeedWidget();
            }),
          ),
        ],
      ),
    );
  }
}
