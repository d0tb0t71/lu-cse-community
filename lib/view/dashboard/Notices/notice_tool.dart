import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as storage;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lu_cse_community/provider/post_provider.dart';
import 'package:lu_cse_community/provider/profile_provider.dart';
import 'package:lu_cse_community/view/sign_in_sign_up/widgets/custom_button.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import '../../../provider/notice_provider.dart';
import '../../../provider/pdf_and_notification_provider.dart';
import '../../public_widget/build_loading.dart';

class NoticeTool {
  NoticeTool(
      {required this.key,
      required this.subject,
      required this.batch,
      required this.section,
      required this.id,
      this.documentSnapshot,
      required this.isSelected,
      required this.imageFile,
      required this.context});
  String key;
  String subject;
  String batch;
  String section;
  String id;
  DocumentSnapshot? documentSnapshot;
  bool isSelected;
  File imageFile;
  BuildContext context;

  Future uploadNotice() async {
    try {
      var pdfPro =
          Provider.of<PDFAndNotificationProvider>(context, listen: false);
      buildLoadingIndicator(context);
      String url = "";

      if (isSelected) {
        final ref = storage.FirebaseStorage.instance
            .ref()
            .child("noticeImage/${DateTime.now()}");

        final result = await ref.putFile(imageFile);
        url = await result.ref.getDownloadURL();
      }
      //final result = await ref.putFile(_imageFile);
      // url = await result.ref.getDownloadURL();

      Provider.of<NoticeProvider>(context, listen: false)
          .addNewNotice(
        subject: subject,
        imageUrl: url,
        dateTime: DateTime.now().toString(),
        batch: batch,
        section: section,
        id: id,
        context: context,
      )
          .then((value) async {
        print(
            "_________________________START__________________________________");

        var collectionRef = FirebaseFirestore.instance
            .collection("users")
            .where("role", isEqualTo: "Test");

        switch (key) {
          case "Teacher":
            collectionRef = FirebaseFirestore.instance
                .collection("users")
                .where("role", isEqualTo: "Teacher");
            break;
          case "Batch":
            collectionRef = FirebaseFirestore.instance
                .collection("users")
                .where("batch", isEqualTo: batch);
            break;
          case "Section":
            var collectionRef = FirebaseFirestore.instance
                .collection("users")
                .where("section", isEqualTo: section);
            break;
          case "Person":
            String email = "cse_${id}@lus.ac.bd";
            var collectionRef = FirebaseFirestore.instance
                .collection("users")
                .where("email", isEqualTo: email.toString());

            print(email);
            break;
        }
        ;

        Future<void> sendNoticeToUser(String key) async {
          // Get docs from collection reference
          QuerySnapshot querySnapshot = await collectionRef.get();
          // Get data from docs and convert map to List
          final allData = querySnapshot.docs.map((doc) => doc).toList();
          List<String> selectedMembers = [];

          for (var data in allData) {
            selectedMembers.add(data["deviceID"]);
          }

          if (subject == "") {
            subject = "New Notice";
          }

          print(selectedMembers);

          if (key == "All") {
            sendNotification(subject);
          } else {
            sendNotificationToDevice(subject, selectedMembers);
          }
        }

        sendNoticeToUser(key);
      });
      Navigator.of(context, rootNavigator: true).pop();
      Navigator.pop(context);
    } catch (e) {
      Navigator.of(context, rootNavigator: true).pop();
    }
  }

  Future<Response> sendNotificationToDevice(
      String subject, dynamic devices) async {
    final uri = Uri.parse(
        'https://node-js-push-notification-server.vercel.app/api/SendNotificationToDevice');
    final headers = {'Content-Type': 'application/json'};
    Map<String, dynamic> body = {"devices": devices, "subject": subject};
    String jsonBody = json.encode(body);
    final encoding = Encoding.getByName('utf-8');

    Response response = await post(
      uri,
      headers: headers,
      body: jsonBody,
      encoding: encoding,
    );

    print(response.body);
    print(response.statusCode);

    return response;
  }

  Future<Response> sendNotification(String subject) async {
    final uri = Uri.parse(
        'https://node-js-push-notification-server.vercel.app/api/SendNotification');
    final headers = {'Content-Type': 'application/json'};
    Map<String, dynamic> body = {"subject": subject};
    String jsonBody = json.encode(body);
    final encoding = Encoding.getByName('utf-8');

    Response response = await post(
      uri,
      headers: headers,
      body: jsonBody,
      encoding: encoding,
    );

    print(response.body);
    print(response.statusCode);

    return response;
  }

  // Future updateNotice() async {
  //   try {
  //     buildLoadingIndicator(context);
  //     String url = "";
  //     if (isSelected) {
  //       final ref = storage.FirebaseStorage.instance
  //           .ref()
  //           .child("noticeImage/${DateTime.now()}");
  //
  //       final result = await ref.putFile(_imageFile);
  //       url = await result.ref.getDownloadURL();
  //     }
  //
  //     if (!isSelected &&
  //         widget.documentSnapshot != null &&
  //         widget.documentSnapshot!["imageUrl"] != "") {
  //       url = widget.documentSnapshot!["imageUrl"];
  //     }
  //
  //     Provider.of<NoticeProvider>(context, listen: false).updateNotice(
  //       postText: postController.text,
  //       id: widget.documentSnapshot!.id,
  //       imageUrl: url,
  //       context: context,
  //     );
  //     Navigator.of(context, rootNavigator: true).pop();
  //     Navigator.pop(context);
  //   } catch (e) {
  //     Navigator.of(context, rootNavigator: true).pop();
  //   }
  // }

}
