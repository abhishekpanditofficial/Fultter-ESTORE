import 'package:flutter/material.dart';
import 'package:test_project/models/catalog.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({super.key, required this.item});
  final Item item;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          // ignore: avoid_print
          print("${item.name} pressed");
        },
        leading: Image.network(item.image),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text("\$${item.price.toString()}",
        textScaleFactor: 1.2,
        // ignore: prefer_const_constructors
        style: TextStyle(
          color: Colors.deepPurple,fontWeight: FontWeight.bold
        ),
        ),
      ),
    );
  }
}