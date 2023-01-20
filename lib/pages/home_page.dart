import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_project/core/store.dart';
import 'package:test_project/models/cart.dart';
import 'package:test_project/models/catalog.dart';
import 'package:test_project/utils/routes.dart';
import 'package:test_project/widgets/drawer.dart';
import 'package:test_project/widgets/home_widgets/catalog_header.dart';
import 'package:test_project/widgets/home_widgets/catalog_list.dart';
import 'package:test_project/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   final int days = 30;

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
   final catalogJson = await rootBundle.loadString("assets/files/catalog.json");
   final decodedData = jsonDecode(catalogJson);
   var productsData = decodedData["products"];
   CatalogModel.items = List.from(productsData).map<Item>((item) => Item.fromMap(item)).toList();
   setState(() {
     
   });
  }
  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;

    // final dummyList = List.generate(20, (index) => CatalogModel.items[0]);

    return Scaffold(
      backgroundColor: context.canvasColor, //Theme.of(context).cardColor
      floatingActionButton: VxBuilder(
        mutations: {AddMutation, RemoveMutation},
        builder: (context, store, status) => FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, MyRoutes.cartPage), 
        backgroundColor: context.theme.buttonColor,
        child: Icon(CupertinoIcons.cart, color: Colors.white,),
        ).badge(color: Vx.red500, size: 20, count: _cart.items.length),
      ),
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CatalogHeader(),
                if(CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                  const CatalogList().py16().expand()
                else
                  CircularProgressIndicator().centered().py16().expand(),
              ],
              ),
          ),
        )
      );
  }
}







// ListView.builder(
//             itemCount: CatalogModel.items.length,
//             itemBuilder: (context, index) {
//               return ItemWidget(item: CatalogModel.items[index]);
//             },
//           )