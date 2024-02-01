
import 'package:flutter/material.dart';
import 'package:flutter_flower_app/model/item.dart';
import 'package:flutter_flower_app/shared/appbar.dart';
import 'package:flutter_flower_app/shared/colors.dart';

// ignore: must_be_immutable
class Details extends StatefulWidget {
  Item product;
  Details({super.key, required this.product});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  bool isShowMore = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [ProductAndPrice()],
        backgroundColor: appbarGreen,
        title: const Text("Details Screen"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(widget.product.imgPath),
            const SizedBox(
              height: 10,
            ),
            Text(
              "\$ ${widget.product.price}",
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 129, 129),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Text(
                    "New",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                const Row(
                  children: [
                    Icon(
                      Icons.star,
                      size: 25,
                      color: Color.fromARGB(255, 255, 191, 0),
                    ),
                    Icon(
                      Icons.star,
                      size: 25,
                      color: Color.fromARGB(255, 255, 191, 0),
                    ),
                    Icon(
                      Icons.star,
                      size: 25,
                      color: Color.fromARGB(255, 255, 191, 0),
                    ),
                    Icon(
                      Icons.star,
                      size: 25,
                      color: Color.fromARGB(255, 255, 191, 0),
                    ),
                    Icon(
                      Icons.star,
                      size: 25,
                      color: Color.fromARGB(255, 255, 191, 0),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 80,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.edit_location,
                      size: 26,
                      color: Color.fromARGB(168, 3, 65, 27),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      widget.product.location,
                      style: const TextStyle(fontSize: 19),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            const SizedBox(
              width: double.infinity,
              child: Text(
                "Detalis : ",
                style: TextStyle(fontSize: 22),
                textAlign: TextAlign.start,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              "A flower, sometimes known as a bloom or blossom, is the reproductive structure found in flowering plants (plants of the division Angiospermae). Flowers produce gametophytes, which in flowering plants consist of a few haploid cells which produce gametes. The male gametophyte, which produces non-motile sperm, is enclosed within pollen grains; the female gametophyte is contained within the ovule. When pollen from the anther of a flower is deposited on the stigma, this is called pollination. Some flowers may self-pollinate, producing seed using pollen from the same flower or a different flower of the same plant, but others have mechanisms to prevent self-pollination and rely on cross-pollination, when pollen is transferred from the anther of one flower to the stigma of another flower on a different individual of the same species.",
              style: const TextStyle(fontSize: 18),
              maxLines: isShowMore ? 3 : null,
              overflow: TextOverflow.fade,
            ),
            TextButton(
                onPressed: () {
                  setState(() {
                    isShowMore = !isShowMore;
                  });
                },
                child: Text(
                  isShowMore ? "Show more" : "Show less",
                  style: const TextStyle(fontSize: 18),
                )),
          ],
        ),
      ),
    );
  }
}
