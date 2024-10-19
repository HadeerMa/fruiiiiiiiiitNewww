import 'package:flutter/material.dart';
import 'package:food_app/widgets/TextApp.dart';
import 'package:food_app/widgets/image.dart';

class Basketcontainer extends StatefulWidget {
    final String item;

  const Basketcontainer({super.key,required this.item});

  @override
  State<Basketcontainer> createState() => _BasketcontainerState();
}

class _BasketcontainerState extends State<Basketcontainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            imageContainer(
              Image1: Image.asset('images/salad.png'),
              wid: 100,
              hid: 100,
            ),
            Column(
              children: [
                Text(
                      widget.item,
                     style: TextStyle(
                      color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400
                     ),
                    ),
                SizedBox(
                  height: 5,
                ),
                TextApp(
                    text: '2packs',
                    color1: Colors.black,
                    size: 16,
                    weight: FontWeight.w400)
              ],
            ),
            Row(
              children: [
                TextApp(
                  text: 'N',
                  color1: Colors.black,
                  size: 18,
                  weight: FontWeight.w500,
                  decoration: TextDecoration.lineThrough,
                  color2: Colors.black,
                  thikness: 2,
                ),
                SizedBox(
                  width: 5,
                ),
                TextApp(
                  text: '20000',
                  color1: Colors.black,
                  size: 18,
                  weight: FontWeight.w500,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
