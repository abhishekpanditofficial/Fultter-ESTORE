import 'package:flutter/material.dart';
import 'package:test_project/models/catalog.dart';
import 'package:test_project/widgets/home_widgets/add_to_cart.dart';
import 'package:test_project/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailPage({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.red800.xl4.make(),
            AddToCart(catalog: catalog).wh(140,50)
          ],
        ).p32(),
      ),
      backgroundColor: context.canvasColor,
      appBar: AppBar(backgroundColor: Colors.transparent,),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
                tag: Key(catalog.id.toString()),
                child: Image.network(
                  catalog.image,
                )).h32(context),
            Expanded(
              child: VxArc(
                height: 30.0,
                edge: VxEdge.TOP,
                arcType: VxArcType.CONVEY,
                child: Container(
                  color: context.cardColor,
                  width: context.screenWidth,
                  child: Column(children: [
                    catalog.name.text.xl4
                        .color(context.accentColor)
                        .bold
                        .make(),
                    catalog.desc.text.xl.textStyle(context.captionStyle).make(),
                    const HeightBox(10),
                    "Deserunt et aliquip anim nulla ipsum anim. Officia adipisicing commodo magna eiusmod ad excepteur enim sint cupidatat. Dolor laborum exercitation deserunt dolore. Elit ea quis cupidatat excepteur sunt magna aute occaecat pariatur velit amet sunt. Veniam irure voluptate occaecat minim do eu reprehenderit reprehenderit excepteur adipisicing tempor. Ut amet ullamco culpa voluptate ipsum adipisicing tempor eiusmod."
                    .text.textStyle(context.captionStyle).make().p16()
                  ]).py64(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
