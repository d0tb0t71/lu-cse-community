import 'package:flutter/material.dart';

SizedBox textField(String hint, Color color, String text , double height , String key) {
  return SizedBox(
    height: height,
    child: TextFormField(
      style: const TextStyle(color: Colors.black, fontSize: 15),
      initialValue: text,
      maxLines: key == "subject" ? 5 : 1,
      minLines: key == "subject" ? 5 : 1,
      textAlign: TextAlign.start,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(10,5, 5, 5),
        filled: true,
        fillColor: color,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xffD8D8D8),
            width: 2,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
            width: 2
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey,),


      ),
    ),
  );
}
