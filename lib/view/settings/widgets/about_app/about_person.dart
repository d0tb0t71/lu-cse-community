import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lu_cse_community/Models/person_model.dart';

import '../../../public_widget/custom_app_bar.dart';

class AboutPerson extends StatelessWidget {

  int id;

  AboutPerson({
    required this.id
});

  List<PersonModel> allPerson = AllPerson().getPersons();

  @override
  Widget build(BuildContext context) {

    print(allPerson);

    return Scaffold(
      backgroundColor: Color(0xff191541),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xff191541),
        elevation: 0,
        leading: Padding(
          padding:  EdgeInsets.only(left: 25.w),
          child: IconButton(
            icon:  Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 22.sp,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
               Container(
                 margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                 child: Column(
                  children: [
                    Container(
                      width: 188.w,
                      height: 188.w,
                      child: Image.asset(allPerson[id].pic),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(allPerson[id].name,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w700,
                        )),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(allPerson[id].designation,
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                    textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),

                  ],
              ),
               ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.fromLTRB(10, 2, 10, 2),
                    decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(50)),
                    child: Icon(
                      Icons.person,
                      color: Colors.black,
                      size: 25.0,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.fromLTRB(10, 2, 10, 2),
                    decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(50)),
                    child: Icon(
                      Icons.phone,
                      color: Colors.black,
                      size: 25.0,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.fromLTRB(10, 2, 10, 2),
                    decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(50)),
                    child: Icon(
                      Icons.mail,
                      color: Colors.black,
                      size: 25.0,
                    ),
                  )
                ],
              ),

              Container(
                margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                padding: EdgeInsets.fromLTRB(20.w, 30.h, 20.w, 0),
                width: double.infinity,
                height: 500.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40)
                    )),
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Thoughts" , style: TextStyle(fontSize: 20.sp ,fontWeight: FontWeight.bold),),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                      child: Divider(color: Colors.grey,height: 5.h,),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 5, 0, 10),
                      child: Text(allPerson[id].tagline , style: TextStyle(fontSize: 16.sp ,fontWeight: FontWeight.w500),),
                    ),
                    Text(allPerson[id].speech , style: TextStyle(fontSize: 14.sp ,fontWeight: FontWeight.w400),),
                  ],
                ),
              )
            ],
          ),

        ),
      ),
    );
  }
}
