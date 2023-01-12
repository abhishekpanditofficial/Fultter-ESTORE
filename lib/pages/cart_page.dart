import 'package:flutter/material.dart';
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
    final _cart = CartModel();
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
        "\$${_cart.totalPrice}".text.xl5.color(context.accentColor).make(),
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

class CartList extends StatefulWidget {
  const CartList({super.key});

  @override
  State<CartList> createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    return _cart.items.isEmpty ? "Nothing to show".text.xl3.make() : ListView.builder(
      itemCount: _cart.items?.length,
      itemBuilder: ((context, index) => ListTile(
        leading: const Icon(Icons.done),
        trailing: IconButton(
          onPressed: (() {
            _cart.remove(_cart.items[index]);
            setState(() { });
          }),
          icon: const Icon(Icons.remove_circle_outline
          ),
      ),
      title: _cart.items[index].name.text.make(),
      )
    ));
  }
}