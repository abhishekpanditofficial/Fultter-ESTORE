import 'package:flutter/material.dart';
import 'package:test_project/core/store.dart';
import 'package:test_project/models/cart.dart';
import 'package:test_project/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';


class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.color(context.accentColor).make(),
      ),
      body: Column(children: [
        CartList().p32().expand(),
        Divider(),
        CartTotal(),
      ]),
    );
  }
}

class CartTotal extends StatelessWidget {
  const CartTotal({super.key});

  @override
  Widget build(BuildContext context) {
  final _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
        //VxBuilder - access to store, VxNotifier - access to context, VxConsumer - mix
        VxConsumer(
          notifications: {},
          builder: ((context, store, status) {
          return "\$${_cart.totalPrice}".text.xl5.color(context.accentColor).make();
        }),
         mutations: {RemoveMutation}),
        30.widthBox,
        ElevatedButton(
        onPressed: (() {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: "Buying not supported yet".text.make()));
        }), 
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(context.theme.buttonColor)
        ),
        child: "Buy".text.color(Colors.white).make()).w32(context),

      ],),
    );
  }
}

class CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      VxState.watch(context, on: [RemoveMutation]);
      final _cart = (VxState.store as MyStore).cart;

    return _cart.items.isEmpty ? "Nothing to show".text.xl3.make() : ListView.builder(
      itemCount: _cart.items?.length,
      itemBuilder: ((context, index) => ListTile(
        leading: const Icon(Icons.done),
        trailing: IconButton(
          onPressed: (() {
            RemoveMutation(_cart.items[index]);
          }),
          icon: const Icon(Icons.remove_circle_outline
          ),
      ),
      title: _cart.items[index].name.text.make(),
      )
    ));
  }
}