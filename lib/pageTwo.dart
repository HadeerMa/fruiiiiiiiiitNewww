import 'package:flutter/material.dart';
import 'package:food_app/mainpage.dart';
import 'package:food_app/widgets/TextApp.dart';
import 'package:food_app/widgets/TextField.dart';
import 'package:food_app/widgets/image.dart';

class Pagetwo extends StatefulWidget {
  const Pagetwo({super.key});

  @override
  State<Pagetwo> createState() => _PagetwoState();
}

class _PagetwoState extends State<Pagetwo> {
  GlobalKey<FormState> formKey = GlobalKey();

  TextEditingController? name = TextEditingController();
  List<String> basketItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFA451),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: imageContainer(
                wid: 360,
                hid: 360,
                Image1: Image.asset(
                  'images/sallah2.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.white,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextApp(
                              text: 'What is your firstname?',
                              color1: Colors.black,
                              size: 22,
                              weight: FontWeight.w800),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            width: 370,
                            height: 56,
                            color: Color(0xffF3F1F1),
                            child:  TexT_Field(control: name,HText: 'Name', LText: 'Enter Your Name', Icon1:Icon(
                                    Icons.person,
                                    color: Color(0xffFFA451),
                                  ),
                                  valid: 
                                       (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your name'; // Error message if empty
                                  }
                                } ,)
                           
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            width: 370,
                            height: 56,
                            decoration: BoxDecoration(
                                color: Color(0xffFFA451),
                                borderRadius: BorderRadius.circular(10)),
                            child: GestureDetector(
                              onTap: () {
                                if (formKey.currentState!.validate()) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Mainpage(
                                                name: name!.text,
                                                 basketItems: basketItems,
                                              )));
                                }
                              },
                              child: Center(
                                child: Text(
                                  'Start Ordering',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
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
            ),
          ],
        ),
      ),
    );
  }
}
