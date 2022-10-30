import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lu_cse_community/view/dashboard/Notices/notice_tool.dart';
import 'package:lu_cse_community/view/dashboard/Notices/push_notification_handler.dart';
import 'package:lu_cse_community/view/dashboard/Notices/text_field.dart';

import 'SubWidgets/custom_text_field.dart';

class IndividualCardsPropertiesClass extends StatefulWidget {
  IndividualCardsPropertiesClass(
      {
        required this.pageName,
        required this.type ,
        required this.documentSnapshot,
        required this.size,
        required this.context,
        required this.subjectController,
        required this.batchController,
        required this.sectionController,
        required this.idController,
      });

  String pageName;
  String? type;
  QueryDocumentSnapshot? documentSnapshot;
  Size size;
  BuildContext context;
  TextEditingController subjectController;
  TextEditingController batchController ;
  TextEditingController sectionController ;
  TextEditingController idController;
  bool isSelected = false;
  late File imageFile;


  @override
  State<IndividualCardsPropertiesClass> createState() => _IndividualCardsPropertiesClassState();
}


class _IndividualCardsPropertiesClassState extends State<IndividualCardsPropertiesClass> {

  Future pickImage(ImageSource imageSource) async {

    ImagePicker picker = ImagePicker();

    try {
      final pickedFile = await picker.pickImage(
        source: imageSource,
        imageQuality: 50,
      );
      if (pickedFile != null) {
        setState(() {
          widget.isSelected = true;
          widget.imageFile = File(pickedFile.path);
        });
      }
    } catch (e) {
      Navigator.of(context, rootNavigator: true).pop();
    }
  }

  Padding addImageSection() {

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              pickImage(ImageSource.gallery);
            },
            child: Container(
              height: 70.h,
              width: 78.w,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.withOpacity(0.4)),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Icons.add_photo_alternate_rounded,
                size: 30,
              ),
            ),
          ),
          SizedBox(width: 15.w),
          if (widget.isSelected)
          Container(
            height: 70.h,
            width: 78.w,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey.withOpacity(0.4)),
              borderRadius: BorderRadius.circular(10),
            ),
            child: widget.isSelected
                ? ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.file(
                  widget.imageFile,
                  fit: BoxFit.cover,
                ))
                : widget.documentSnapshot != null &&
                widget.type == "Post" &&
                widget.documentSnapshot!["imageUrl"] != ""
                ? ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                widget.documentSnapshot!["imageUrl"],
                fit: BoxFit.cover,
              ),
            )
                : widget.documentSnapshot != null &&
                widget.documentSnapshot!["url"] != ""
                ? ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                widget.documentSnapshot!["url"],
                fit: BoxFit.cover,
              ),
            )
                : const Icon(
              Icons.image,
              size: 30,
            ),
          )
        ],
      ),
    );
  }

  Container _buildButton(String text, bool showBorder) {
    return Container(
      height: 45.h,
      width: 356.w,
      decoration: BoxDecoration(
        color: showBorder ? Colors.black : Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          text,
          style: GoogleFonts.inter(
            fontSize: 16.sp,
            color: showBorder ? Colors.white : Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }





  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            const Divider(),
            Column(
              children: [
                if (widget.pageName == "For All Users")
                  CustomTextField(
                      "For All Users", "Subject", widget.subjectController, context),
                if (widget.pageName == "For all Teachers")
                  CustomTextField(
                      "For all Teachers", "Subject", widget.subjectController, context),
                if (widget.pageName == "For a Batch")
                  CustomTextField(
                      "For a Batch", "Batch", widget.batchController, context),
                if (widget.pageName == "For a Batch")
                  CustomTextField(
                      "For a Batch", "Subject", widget.subjectController, context),
                if (widget.pageName == "For a Section")
                  CustomTextField(
                      "For a Section", "Batch", widget.batchController, context),
                if (widget.pageName == "For a Section")
                  CustomTextField(
                      "For a Section", "Section", widget.sectionController, context),
                if (widget.pageName == "For a Section")
                  CustomTextField(
                      "For a Section", "Subject", widget.subjectController, context),
                if (widget.pageName == "For a Person")
                  CustomTextField("For a Person", "ID", widget.idController, context),
                if (widget.pageName == "For a Person")
                  CustomTextField(
                      "For a Person", "Subject", widget.subjectController, context),
                addImageSection(),
                InkWell(
                    onTap: (){

                      String key = "All";
                      switch(widget.pageName){
                        case "For All Users":
                          key = "All";
                          break;
                        case "For all Teachers":
                          key = "Teacher";
                          break;
                        case "For a Batch":
                          key = "Batch";
                          break;
                        case "For a Section":
                          key = "Section";
                          break;
                        case "For a Person":
                          key = "Person";
                          break;

                      };

                      NoticeTool(key : key , subject: widget.subjectController.text, batch: widget.batchController.text, section: widget.sectionController.text, id: widget.idController.text, context: context, isSelected: widget.isSelected, imageFile: widget.imageFile).uploadNotice();
                    },
                    child: _buildButton("Publish Now", true)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
