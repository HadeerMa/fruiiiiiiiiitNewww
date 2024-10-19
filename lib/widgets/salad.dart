import 'package:flutter/material.dart';
import 'package:food_app/specialSalad.dart';
import 'package:food_app/widgets/TextApp.dart';
import 'package:food_app/widgets/image.dart';

class Salad extends StatefulWidget {
  Salad({super.key, this.color1, this.shadow1});
  Color? color1;
  List<BoxShadow>? shadow1 = [];

  @override
  State<Salad> createState() => _SaladState();
}

class _SaladState extends State<Salad> {
  bool isfavorite = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Specialsalad(basketItems: [])));
      },
      child: Container(
        height: 200,
        width: 160,
        decoration: BoxDecoration(
            color: widget.color1,
            boxShadow: widget.shadow1,
            borderRadius: BorderRadius.circular(10)
            // border: Border.all(color: Color(0xffFFA451)),
            // borderRadius: BorderRadius.circular(
            //   10,
            // ),
            // boxShadow: []
            ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    isfavorite = !isfavorite;
                  });
                },
                child: Icon(
                  isfavorite ? Icons.favorite : Icons.favorite_border_outlined,
                  color: Color(0xffFFA451),
                ),
              ),
              imageContainer(
                wid: 100,
                hid: 100,
                Image1: Image.asset(
                  'images/salad.png',
                  fit: BoxFit.contain,
                ),
              ),
              Center(
                  child: TextApp(
                      text: 'Honey lime combo',
                      color1: Colors.black,
                      size: 16,
                      weight: FontWeight.w500)),
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          'N',
                          style: TextStyle(
                            color: Color(0xffFFA451),
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            wordSpacing: 1,
                            decoration: TextDecoration.lineThrough,
                            decorationColor: Color(0xffFFA451),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        TextApp(
                            text: "2000",
                            color1: Color(0xffFFA451),
                            size: 20,
                            weight: FontWeight.w500)
                      ],
                    ),
                    Icon(
                      Icons.add_circle,
                      color: Color(0xffFFA451),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
