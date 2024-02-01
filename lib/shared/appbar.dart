

import 'package:flutter_flower_app/pages/checkout.dart';
import 'package:flutter_flower_app/provider/cart.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';

class ProductAndPrice extends StatelessWidget {
  const ProductAndPrice({super.key});

  @override
  Widget build(BuildContext context) {
    final classInstancee = Provider.of<Cart>(context);

    return Row(
      children: [
        Stack(
          children: [
            Container(
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                    color: Color.fromARGB(211, 164, 255, 193),
                    shape: BoxShape.circle),
                child: Text(
                  "${classInstancee.selectedProducts.length}",
                  style: const TextStyle(
                      fontSize: 15, color: Color.fromARGB(255, 0, 0, 0)),
                )),
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CheckOut(),
                    ),
                  );
                },
                icon: const Icon(Icons.add_shopping_cart)),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: Text(
            "\$ ${classInstancee.price}",
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }
}
