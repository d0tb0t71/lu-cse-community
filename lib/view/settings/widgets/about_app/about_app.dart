import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lu_cse_community/view/settings/widgets/about_app/about_person.dart';

import '../../../public_widget/custom_app_bar.dart';

class AboutApp extends StatefulWidget {
  const AboutApp({Key? key}) : super(key: key);

  @override
  State<AboutApp> createState() => _AboutAppState();
}

class _AboutAppState extends State<AboutApp> {
  int size = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar("About App", context),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Teachers",
                      style:
                          TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w800),
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => AboutPerson(id: 0)),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.all(5),
                            child: Column(
                              children: [
                                Container(
                                  width: 188.w,
                                  height: 188.w,
                                  child: Image.asset('assets/about_images/t1.png'),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Text("Rumel M. S. Rahman Pir",
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w700,
                                    )),
                                Text("Associate Professor & Head",
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                    )),
                                Text("Computer Science & Engineering",

                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                    ))
                              ],
                            ),
                          ),
                        ),
                       InkWell(
                         onTap: (){
                           Navigator.push(
                             context,
                             MaterialPageRoute(builder: (context) => AboutPerson(id: 1)),
                           );
                         },
                         child: Container(
                           margin: EdgeInsets.all(5),
                           child:  Column(
                             children: [
                               Container(
                                 width: 188.w,
                                 height: 188.w,
                                 child: Image.asset('assets/about_images/t2.png'),
                               ),
                               SizedBox(
                                 height: 5.h,
                               ),
                               Text("Prithwiraj Bhattacharjee",
                                   style: TextStyle(
                                     fontSize: 16.sp,
                                     fontWeight: FontWeight.w700,
                                   )),
                               Text("Lecturer",
                                   style: TextStyle(
                                     color: Colors.black54,
                                     fontSize: 12.sp,
                                     fontWeight: FontWeight.w400,
                                   )),
                               Text("Computer Science & Engineering",
                                   textAlign: TextAlign.center,
                                   style: TextStyle(
                                     color: Colors.black54,
                                     fontSize: 12.sp,
                                     fontWeight: FontWeight.w400,
                                   ))
                             ],
                           ),
                         ),
                       )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Students",
                      style:
                          TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w800),
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => AboutPerson(id: 2)),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.all(5),
                            child: Column(

                              children: [
                                Container(
                                  width: 188.w,
                                  height: 188.w,
                                  child: Image.asset('assets/about_images/s1.png'),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Text("Dipon Sutradhar",
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w700,
                                    )),
                                Text("ID : 1912020131",
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                    )),
                                Text("Computer Science & Engineering",

                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                    ))
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => AboutPerson(id: 3)),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.all(5),
                            child:  Column(
                              children: [
                                Container(
                                  width: 188.w,
                                  height: 188.w,
                                  child: Image.asset('assets/about_images/s2.png'),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Text("Turja Sen Das Partho",
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w700,
                                    )),
                                Text("ID : 1912020093",
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                    )),
                                Text("Computer Science & Engineering",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                    ))
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => AboutPerson(id: 4)),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.all(5),
                            child: Column(

                              children: [
                                Container(
                                  width: 188.w,
                                  height: 188.w,
                                  child: Image.asset('assets/about_images/s3.png'),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Text("Sajid Mohammad Ikram",
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w700,
                                    )),
                                Text("ID : 1912020131",
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                    )),
                                Text("Computer Science & Engineering",

                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                    ))
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(5),
                          child:  Column(
                            children: [
                              Container(
                                width: 188.w,
                                height: 188.w,
                                child: Container(),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Text("",
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w700,
                                  )),
                              Text("",
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                  )),
                              Text("",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                  ))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
