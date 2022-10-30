import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

Container CustomTextField(String text, String hint,TextEditingController myController, BuildContext context) {
  return Container(
    margin: EdgeInsets.symmetric( vertical: 3.h,horizontal: 2.w),
    width: 400.w,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        TextField(
          style: const TextStyle(color: Colors.black),
          textAlign: TextAlign.justify,
          controller: myController,

          minLines: text == "For All Users" && hint == "Subject" ? 4 : text == "For all Teachers" && hint == "Subject" ? 4 : text == "For a Batch" && hint == "Subject" ? 4 : text == "For a Section" && hint == "Subject" ? 4 : text == "For a Person" && hint == "Subject" ? 4 : 1,
          maxLines: 4,
          maxLength: text == "post" || text == "Event Description" ? 500 : null,
          keyboardAppearance: Brightness.light,
          //keyboardType: TextInputType.emailAddress,
          keyboardType: hint == "Batch" || hint == "ID" ? TextInputType.number : TextInputType.text,
          decoration: InputDecoration(
            errorStyle: GoogleFonts.inter(fontSize: 0.01),
            suffixIcon: text == "Event Schedule"
                ? const Icon(Icons.keyboard_arrow_down)
                : null,
            contentPadding: EdgeInsets.only(
                left: 8.w,
                top: 8,
                bottom: 8,
                right: 8.w
            ),
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.grey.withOpacity(0.5),
                )),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.black,
                )),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.red,
                )),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.grey,
                )),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Colors.grey.withOpacity(0.5),
              ),
            ),
            hintText: hint,
            hintStyle: GoogleFonts.inter(
                color: Colors.grey.withOpacity(0.5), fontSize: 15.sp),
          ),
        )
      ],
    ),
  );
}