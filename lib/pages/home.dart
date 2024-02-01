
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flower_app/model/item.dart';
import 'package:flutter_flower_app/pages/checkout.dart';
import 'package:flutter_flower_app/pages/details_screen.dart';
import 'package:flutter_flower_app/pages/profile_page.dart';
import 'package:flutter_flower_app/provider/cart.dart';
import 'package:flutter_flower_app/shared/appbar.dart';
import 'package:flutter_flower_app/shared/colors.dart';
import 'package:flutter_flower_app/shared/user_img_from_firestore.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final classInstancee = Provider.of<Cart>(context);
    // final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 33),
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Details(product: items[index]),
                    ),
                  );
                },
                child: GridTile(
                  footer: GridTileBar(
                    trailing: IconButton(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        onPressed: () {
                          classInstancee.add(items[index]);
                        },
                        icon: const Icon(
                          Icons.add,
                          size: 25,
                        )),
                    leading: const Text(
                      "\$12.99",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    title: const Text(
                      "",
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: -3,
                        bottom: -9,
                        right: 0,
                        left: 0,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(55),
                            child: Image.asset(items[index].imgPath)),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/img/zeyad.jpg"),
                        fit: BoxFit.cover),
                  ),
                  currentAccountPicture: ImgUser(),
                  accountEmail: Text("zeyad@gmail.com"),
                  accountName: Text(
                    "Zeyad Elshenhab",
                    style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                ),
                ListTile(
                  title: const Text("Home"),
                  leading: const Icon(Icons.home),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Home(),
                      ),
                    );
                  },
                ),
                ListTile(
                    title: const Text("My products"),
                    leading: const Icon(Icons.add_shopping_cart),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CheckOut(),
                        ),
                      );
                    }),
                ListTile(
                    title: const Text("About"),
                    leading: const Icon(Icons.help_center),
                    onTap: () {}),
                ListTile(
                    title: const Text("Profile Page"),
                    leading: const Icon(Icons.person),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProfilePage(),
                          ));
                    }),
                ListTile(
                    title: const Text("Logout"),
                    leading: const Icon(Icons.exit_to_app),
                    onTap: () async {
                      await FirebaseAuth.instance.signOut();
                    }),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 12),
              child: const Text("Developed by Zeyad Elshenhab © 2023",
                  style: TextStyle(fontSize: 16)),
            )
          ],
        ),
      ),
      appBar: AppBar(
        actions: const [ProductAndPrice()],
        backgroundColor: appbarGreen,
        title: const Text("Home"),
      ),
    );
  }
}
