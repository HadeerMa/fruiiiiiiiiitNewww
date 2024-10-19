import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_app/congrats.dart';
import 'package:food_app/widgets/TextApp.dart';
import 'package:food_app/widgets/basketContainer.dart';

class Basketpage extends StatefulWidget {
  final List<String> basketItems;

  Basketpage({super.key, required this.basketItems});

  @override
  State<Basketpage> createState() => _BasketpageState();
}

class _BasketpageState extends State<Basketpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: TextApp(
            text: 'My Basket',
            color1: Colors.white,
            size: 25,
            weight: FontWeight.w600),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: widget.basketItems.length,
              itemBuilder: (context, index) {
                return Basketcontainer(item: widget.basketItems[index]);
              },
              separatorBuilder: (context, index) => SizedBox(height: 25),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    TextApp(
                        text: 'Total',
                        color1: Colors.black,
                        size: 20,
                        weight: FontWeight.w500),
                    TextApp(
                        text: '20000',
                        color1: Colors.black,
                        size: 20,
                        weight: FontWeight.w500),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    _showCheckoutPopup();
                  },
                  child: Container(
                    width: 250,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Color(0xffFFA451),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: TextApp(
                          text: 'CheckOut',
                          color1: Colors.white,
                          size: 18,
                          weight: FontWeight.w500),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showCheckoutPopup() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent, // Transparent background
      builder: (context) {
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // To fit the content
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextApp(
                text: 'Checkout',
                color1: Colors.black,
                size: 24,
                weight: FontWeight.bold,
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Delivery address',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Number we can call',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => congrats()));
                    },
                    child: Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: Color(0xffFFA451),
                              style: BorderStyle.solid)),
                      child: Center(
                          child: TextApp(
                              text: 'Pay on delivery',
                              color1: Color(0xffFFA451),
                              size: 20,
                              weight: FontWeight.w500)),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => congrats()));
                    },
                    child: Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: Color(0xffFFA451),
                              style: BorderStyle.solid)),
                      child: Center(
                          child: TextApp(
                              text: 'Pay on delivery',
                              color1: Color(0xffFFA451),
                              size: 20,
                              weight: FontWeight.w500)),
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
