import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TexT_Field extends StatelessWidget {
  TexT_Field(
      {super.key, this.control, required this.HText, required this.LText,required this.Icon1,this.valid});
  TextEditingController? control;
  String LText;
  String HText;
  Icon Icon1;
    String? Function(String?)? valid;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: control,
        decoration: InputDecoration(
          labelText: LText,
          hintText: HText,
          prefixIcon: Icon1,
          floatingLabelStyle: TextStyle(color: Color(0xffFFA451)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Color(0xffFFA451)),
          ),
        ),
        validator: valid,
        );
  }
}
