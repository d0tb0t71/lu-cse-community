import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'edit_address.dart';
import 'individual_card_properties.dart';

class IndividualNoticeSection extends StatefulWidget {
  final String pageName;

  const IndividualNoticeSection({Key? key, required this.pageName}) : super(key: key);

  @override
  _IndividualNoticeSectionState createState() => _IndividualNoticeSectionState();
}

class _IndividualNoticeSectionState extends State<IndividualNoticeSection> {
  double _height = 80.0;
  TextEditingController subjectController = TextEditingController();
  TextEditingController batchController = TextEditingController();
  TextEditingController sectionController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController temp = TextEditingController();
  QueryDocumentSnapshot? documentSnapshot;

  changeHeight(Size size , int index) {
    if (index == 0 && _height == 80.0 ) {
      _height = size.height * 0.42;
    } else if (index == 1 && _height == 80.0 ) {
      _height = size.height * 0.42;
    }else if (index == 2 && _height == 80.0 ) {
      _height = size.height * 0.485;
    } else if (index == 3 && _height == 80.0 ) {
      _height = size.height * 0.55;
    } else if (index == 4 && _height == 80.0 ) {
      _height = size.height * 0.48;
    }
    else {
      _height = 80.0 ;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AnimatedContainer(
      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
      alignment: Alignment.center,
      curve: Curves.bounceOut,
      duration: const Duration(milliseconds: 800),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      width: double.infinity,
      height: _height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 10),
                Icon(Icons.person,size: 40.h,),
                SizedBox(width: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.pageName,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: size.width * 0.04),
                    ),
                    Text(
                     widget.pageName == "For All Users" ? "This will send notification to all users" :
                      widget.pageName == "For all Teachers" ? "This will send notification to all teachers" :
                          widget.pageName == "For a Batch" ? "This will send notification to a section" :
                          widget.pageName == "For a Section" ? "This will send notification to a section" :
                              widget.pageName == "For a Person" ? "This will send notification to a person" : "",
                      style: TextStyle(
                          fontSize: size.width * 0.028, color: Colors.grey),
                    ),

                  ],
                ),
                Spacer(),
                Transform.rotate(
                  angle: _height == 80.0 ? 0 : 180 * pi / 180 ,
                  child: IconButton(
                    onPressed: () {
                      setState(() {


                        if(widget.pageName == "For All Users"){
                            changeHeight(size , 0);
                        } else if(widget.pageName == "For all Teachers"){
                            changeHeight(size , 1);
                        } else if(widget.pageName == "For a Batch"){
                            changeHeight(size , 2);
                        } else if(widget.pageName == "For a Section"){
                            changeHeight(size , 3);
                        } else if(widget.pageName == "For a Person"){
                            changeHeight(size , 4);
                        }
                      });
                    },
                    icon: Icon(
                      _height == 80.0
                          ? Icons.arrow_drop_down_circle_outlined
                          : Icons.arrow_drop_down_circle_outlined,
                      color: Color(0xff191541),
                    ),
                  ),
                )
              ],
            ),
          ),
          if (_height != 80.0)
            IndividualCardsPropertiesClass(pageName: widget.pageName , type: "notice", documentSnapshot: documentSnapshot, size: size, context: context, subjectController: subjectController, batchController: batchController, sectionController: sectionController, idController: idController)

        ],
      ),
    );
  }
}
