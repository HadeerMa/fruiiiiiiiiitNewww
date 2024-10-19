import 'package:flutter/material.dart';
import 'package:food_app/mainpage.dart';
import 'package:food_app/track.dart';
import 'package:food_app/widgets/TextApp.dart';
import 'package:food_app/widgets/image.dart';

class congrats extends StatelessWidget {
  const congrats({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          imageContainer(
            Image1: Image.asset('images/congrast.png'),
          ),
          TextApp(
              text: 'Congratulations!!!',
              color1: Colors.black,
              size: 30,
              weight: FontWeight.w600),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 30),
            child: TextApp(
                text: 'Your order have been taken and is being attended to',
                color1: Colors.black,
                size: 18,
                weight: FontWeight.w400),
          ),
          SizedBox(
            height: 50,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Track()));
            },
            child: Container(
              width: 250,
              height: 50,
              decoration: BoxDecoration(
                  color: Color(0xffFFA451),
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: TextApp(
                    text: 'Track order',
                    color1: Colors.white,
                    size: 18,
                    weight: FontWeight.w500),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                      color: Color(0xffFFA451), style: BorderStyle.solid)),
              child: Center(
                  child: TextApp(
                      text: 'Continue shopping',
                      color1: Color(0xffFFA451),
                      size: 20,
                      weight: FontWeight.w500)),
            ),
          ),
        ],
      ),
    );
  }
}
