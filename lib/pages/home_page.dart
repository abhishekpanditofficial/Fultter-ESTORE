import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_project/models/catalog.dart';
import 'package:test_project/widgets/drawer.dart';
import 'package:test_project/widgets/item_widget.dart';


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
    // ignore: prefer_const_declarations
   
    // final dummyList = List.generate(20, (index) => CatalogModel.items[0]);

    return Scaffold(
        appBar: AppBar(
          // ignore: prefer_const_constructors
          title: Text("Catalog App", style: TextStyle(color: Colors.black),)
        ),
        // ignore: avoid_unnecessary_containers
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: CatalogModel.items != null && CatalogModel.items.isNotEmpty ?  GridView.builder(
            // ignore: prefer_const_constructors
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 16, crossAxisSpacing: 16),
            itemBuilder: (context, index) {
              final item = CatalogModel.items[index];
              return Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: GridTile(
                  header: Container(
                    // ignore: prefer_const_constructors
                    padding: EdgeInsets.all(12),
                    // ignore: prefer_const_constructors
                    decoration: BoxDecoration(
                      color: Colors.deepPurple
                    ),
                    // ignore: prefer_const_constructors
                    child: Text(item.name, style: TextStyle(color: Colors.white),)
                    ),
                  footer: Container(
                    // ignore: prefer_const_constructors
                    padding: EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                      color: Colors.white
                    ),
                    child: Text("\$${item.price.toString()}", style: const TextStyle(color: Colors.deepPurple),)
                    ),
                  child: Image.network(item.image, fit: BoxFit.contain,)
                  ),
                );
            },
            itemCount: CatalogModel.items.length,
            ) 
          : const Center(child: CircularProgressIndicator(),),
        ),
        // ignore: prefer_const_constructors
        drawer: MyDrawer(), 
      );
  }
}

// ListView.builder(
//             itemCount: CatalogModel.items.length,
//             itemBuilder: (context, index) {
//               return ItemWidget(item: CatalogModel.items[index]);
//             },
//           )