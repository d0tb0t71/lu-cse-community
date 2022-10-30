//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:lu_cse_community/view/dashboard/Notices/text_field.dart';
//
// Widget editAddress(Size size) {
//   return Expanded(
//     child: PageView.builder(
//       itemBuilder: (context, position) {
//         return ListView(
//           physics: const BouncingScrollPhysics(),
//           children: <Widget>[
//             const Divider(),
//             const SizedBox(height: 20),
//             Column(
//               children: <Widget>[
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 10),
//                   child: textField(Icons.account_circle_outlined, "",
//                       const Color(0xffF4F5F9), "Shane Crown"),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 10),
//                   child: textField(Icons.add_location_alt_outlined, "",
//                       const Color(0xffF4F5F9), "2811 Crescent Day, LA Port"),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     SizedBox(
//                       height: 62,
//                       width: (size.width * 0.5) - 25,
//                       child: Padding(
//                         padding: const EdgeInsets.only(left: 10),
//                         child: textField(Icons.add_location_alt_outlined, "",
//                             const Color(0xffF4F5F9), "California"),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 62,
//                       width: (size.width * 0.5) - 25,
//                       child: Padding(
//                         padding: const EdgeInsets.only(right: 10),
//                         child: textField(Icons.auto_awesome_mosaic_outlined, "",
//                             const Color(0xffF4F5F9), "77571"),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 10),
//                   child: textField(FontAwesomeIcons.globeAmericas, "",
//                       const Color(0xffF4F5F9), "2811 Crescent Day, LA Port"),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 10),
//                   child: textField(FontAwesomeIcons.phone, "",
//                       const Color(0xffF4F5F9), "+1 345 833 0221"),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: const [
//                     Padding(
//                       padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.fromLTRB(10, 5, 15, 10),
//                       child: Text("Make Default"),
//                     ),
//
//                   ],
//                 ),
//               ],
//             ),
//           ],
//         );
//       },
//     ),
//   );
// }
