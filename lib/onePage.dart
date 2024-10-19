import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_app/pageTwo.dart';
import 'package:food_app/widgets/TextApp.dart';
import 'package:food_app/widgets/image.dart';

class Onepage extends StatelessWidget {
  const Onepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFA451),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: imageContainer(
              wid: 360,
              hid:360,
              Image1: Image.asset('images/sallah.png', fit: BoxFit.contain,),),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.white,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Get The Freshest Fruit Salad Combo',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w800),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'We deliver the best and freshest fruit salad in town. Order for a combo today!!!',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: Container(
                          width: 370,
                          height: 56,
                          decoration: BoxDecoration(
                              color: Color(0xffFFA451),
                              borderRadius: BorderRadius.circular(10)),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const Pagetwo()));
                            },
                            child: Center(
                              child: TextApp(text: 'Let’s Continue', color1:  Colors.white, size: 16, weight: FontWeight.w600)
                              
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
