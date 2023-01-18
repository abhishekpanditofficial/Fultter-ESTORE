import 'package:flutter/material.dart';
import 'package:test_project/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                "E-Store".text.xl5.bold.color(context.primaryColor).make(),
                "Trending products".text.color(context.accentColor).xl2.make()
              ],
        );
  }
}