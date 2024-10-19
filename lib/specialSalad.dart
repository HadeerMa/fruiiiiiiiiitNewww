import 'package:flutter/material.dart';
import 'package:food_app/basketPage.dart';
import 'package:food_app/widgets/TextApp.dart';
import 'package:food_app/widgets/image.dart';

class Specialsalad extends StatefulWidget {
    final List<String> basketItems;

  Specialsalad({
    super.key,
    required this.basketItems
  });
  @override
  State<Specialsalad> createState() => _SpecialsaladState();
}

class _SpecialsaladState extends State<Specialsalad> {
  int quantity = 1;
  bool isfavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        // backgroundColor: const Color(0xffFFA451),
        appBar: AppBar(
          backgroundColor: Color(0xffFFA451),
          leading: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 380,
              decoration: BoxDecoration(
                  color: Color(0xffFFA451),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: imageContainer(
                hid: 250,
                wid: 250,
                Image1: Image.asset('images/salad.png'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: TextApp(
                  text: 'Quinoa Fruit Salad',
                  color1: Colors.black,
                  size: 28,
                  weight: FontWeight.w600),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          quantity++;
                        });
                      },
                      icon: Icon(
                        Icons.add_circle_outline,
                        color: Color(0xffFFA451),
                        size: 25,
                      )),
                  TextApp(
                    text: '$quantity',
                    color1: Colors.black,
                    size: 30,
                    weight: FontWeight.w500,
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          if (quantity > 1) {
                            quantity--;
                          }
                        });
                      },
                      icon: Icon(
                        Icons.remove_circle_outline,
                        color: Color(0xffFFA451),
                        size: 25,
                      )),
                  Row(
                    children: [
                      TextApp(
                        text: 'N',
                        color1: Colors.black,
                        size: 30,
                        weight: FontWeight.w500,
                        decoration: TextDecoration.lineThrough,
                        color2: Colors.black,
                        thikness: 2,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      TextApp(
                          text: '2000',
                          color1: Colors.black,
                          size: 30,
                          weight: FontWeight.w500),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: TextApp(
                text: 'One Pack Contains:',
                color1: Colors.black,
                size: 22,
                weight: FontWeight.w500,
                decoration: TextDecoration.underline,
                color2: Color(0xffFFA451),
                thikness: 4,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: TextApp(
                  text:
                      'Red Quinoa, Lime, Honey, Blueberries, Strawberries, Mango, Fresh mint.',
                  color1: Colors.black,
                  size: 18,
                  weight: FontWeight.w400),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: TextApp(
                    text:
                        'If you are looking for a new fruit salad to eat today, quinoa is the perfect brunch for you. make',
                    color1: Colors.black,
                    size: 16,
                    weight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isfavorite = !isfavorite;
                      });
                    },
                    child: Icon(
                      isfavorite
                          ? Icons.favorite
                          : Icons.favorite_border_outlined,
                      color: Color(0xffFFA451),
                      size: 40,
                    ),
                  ),
                  GestureDetector(
              onTap: () {
                setState(() {
                  widget.basketItems.add('Quinoa Fruit Salad');
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Basketpage(
                            basketItems: widget.basketItems,
                          )),
                );
              },
              child: Container(
                width: 250,
                height: 50,
                decoration: BoxDecoration(
                    color: Color(0xffFFA451),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: TextApp(
                      text: 'Add to Basket',
                      color1: Colors.white,
                      size: 18,
                      weight: FontWeight.w500),
                ),
              ),
            )
          ],
        ),
      ),
    ],)
    );
  }
}