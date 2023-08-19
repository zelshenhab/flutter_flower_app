// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_flower_app/provider/cart.dart';
import 'package:flutter_flower_app/shared/appbar.dart';
import 'package:flutter_flower_app/shared/colors.dart';
import 'package:provider/provider.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    final classInstancee = Provider.of<Cart>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text("Check out"),
          actions: [ProductAndPrice()],
          backgroundColor: appbarGreen,
        ),
        body: Column(
          children: [
            SingleChildScrollView(
              child: SizedBox(
                height: 600,
                child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: classInstancee.selectedProducts.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: ListTile(
                          subtitle: Text(
                              "${classInstancee.selectedProducts[index].price}, ${classInstancee.selectedProducts[index].location}"),
                          leading: CircleAvatar(
                            backgroundImage: AssetImage(
                                classInstancee.selectedProducts[index].imgPath),
                          ),
                          title:
                              Text(classInstancee.selectedProducts[index].name),
                          trailing: IconButton(
                              onPressed: () {
                                classInstancee.delete(
                                    classInstancee.selectedProducts[index]);
                              },
                              icon: Icon(Icons.remove)),
                        ),
                      );
                    }),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(BTNpink),
                padding: MaterialStateProperty.all(EdgeInsets.all(12)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8))),
              ),
              child: Text(
                "Pay \$${classInstancee.price}",
                style: TextStyle(fontSize: 19),
              ),
            ),
          ],
        ));
  }
}
