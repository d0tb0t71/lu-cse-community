import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class PushNotificationHandler extends StatefulWidget {
  const PushNotificationHandler({Key? key}) : super(key: key);




  @override
  State<PushNotificationHandler> createState() => _PushNotificationHandlerState();
}


class _PushNotificationHandlerState extends State<PushNotificationHandler> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: InkWell(
          onTap: () => showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('AlertDialog Title'),
              content: const Text('AlertDialog description'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, 'OK'),
                  child: const Text('OK'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }






}


