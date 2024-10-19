import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class imageContainer extends StatelessWidget {
  imageContainer({super.key, this.Image1,this.wid,this.hid});
  Image? Image1;
  double? wid;
  double? hid;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: wid,
        height: hid,
        child: Image1,
        
      ),
    );
  }
}
