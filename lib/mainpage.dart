import 'package:flutter/material.dart';
import 'package:food_app/basketPage.dart';
import 'package:food_app/widgets/TextApp.dart';
import 'package:food_app/widgets/TextField.dart';
import 'package:food_app/widgets/salad.dart';

class Mainpage extends StatefulWidget {
  Mainpage({
    super.key,
    required this.name,
    required this.basketItems
  });
  final String name;
      final List<String> basketItems;


  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
    List<String> basketItems = [];

  List<Color>? Colors2 = [
    Color(0xffFFFAEB),
    Color(0xffFEF0F0),
    Color(0xffF1EFF6),
  ];

  String selectedCategory = 'Hottest';

  Widget getCategoryList() {
    switch (selectedCategory) {
      case 'Hottest':
        return buildListView(Colors2!);
      case 'Popular':
        return buildListView([Colors.green, Colors.blue, Colors.yellow]);
      case 'New combo':
        return buildListView([Colors.purple, Colors.pink, Colors.orange]);
      case 'Top':
        return buildListView([Colors.red, Colors.brown, Colors.cyan]);
      default:
        return buildListView(Colors2!);
    }
  }

  Widget buildListView(List<Color> colors) {
    return Container(
      height: 200,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Salad(
          color1: colors[index % colors.length],
        ),
        separatorBuilder: (context, index) => SizedBox(
          width: 25,
        ),
        itemCount: 5,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.97),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(top: 60, left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.menu),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Basketpage(                                                             basketItems: widget.basketItems,

)));
                      },
                      child: Icon(
                        Icons.shopping_cart,
                        color: Color(0xffFFA451),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              TextApp(
                  text:
                      'Hello ${widget.name}, What fruit salad combo do you want today?',
                  color1: Colors.black,
                  size: 20,
                  weight: FontWeight.w400),
              SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  // Expanded TextFormField first
                  Expanded(
                    child: Container(
                        height: 56,
                        decoration: BoxDecoration(
                          color: Color(0xffF3F1F1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: TexT_Field(
                            HText: 'Search for fruit salad combos',
                            LText: "Search for fruit salad combos",
                            Icon1: Icon(
                              Icons.search,
                              color: Color(0xffFFA451),
                            ))),
                  ),
                  SizedBox(width: 10), // Space between TextFormField and Icon
                  // Icon after the TextFormField
                  Icon(
                    Icons.format_align_center,
                    color: Color(0xffFFA451),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              TextApp(
                  text: 'Recommended Combo',
                  color1: Colors.black,
                  size: 23,
                  weight: FontWeight.w500),

              SizedBox(
                height: 25,
              ),
              // ListView.builder(
              //     itemCount: 5,
              //     scrollDirection: Axis.vertical,
              //     itemBuilder: (context, index) => Salad())
              Container(
                height: 200,
                child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Salad(
                          color1: Colors.white,
                          shadow1: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset.zero)
                          ],
                        ),
                    separatorBuilder: (context, index) => SizedBox(
                          width: 25,
                        ),
                    itemCount: 5),
              ),
              SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCategory = 'Hottest';
                      });
                    },
                    child: Text(
                      'Hottest',
                      style: TextStyle(
                        color: selectedCategory == 'Hottest'
                            ? Colors.black
                            : Colors.grey,
                        fontSize: 23,
                        fontWeight: FontWeight.w500,
                        decoration: selectedCategory == 'Hottest'
                            ? TextDecoration.underline
                            : null,
                        decorationColor: Color(0xffFFA451),
                        decorationThickness: 3,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCategory = 'Popular';
                      });
                    },
                    child: Text(
                      'Popular',
                      style: TextStyle(
                        color: selectedCategory == 'Popular'
                            ? Colors.black
                            : Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCategory = 'New combo';
                      });
                    },
                    child: Text(
                      'New combo',
                      style: TextStyle(
                        color: selectedCategory == 'New combo'
                            ? Colors.black
                            : Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCategory = 'Top';
                      });
                    },
                    child: Text(
                      'Top',
                      style: TextStyle(
                        color: selectedCategory == 'Top'
                            ? Colors.black
                            : Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 35,
              ),
              // Display list based on the selected category
              getCategoryList(),
            ],
          ),
        ),
      ),
    );
  }
}

