import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:tvis/constants.dart';

import '../Services/firebaseAuth.dart';

class HomePage extends StatefulWidget {
  HomePage({required this.auth});
  final Auth auth;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isInside = true;
  var details = {};
  String encodedJson = "";

  @override
  void initState() {
    _getDetails();
  }

  Future<void> _getDetails() async{
    details = await widget.auth.getUserDetails();
    setState(() {
      isInside = details['status'] as bool;
      encodedJson = jsonEncode(details);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: kSecondaryColor,
          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //       image: AssetImage("assets/images/bg.png"), fit: BoxFit.cover),
          // ),
          child: Column(
            children: [
              const SizedBox(
                height: 30.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 100.0,
                    decoration: kBorder,
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 8.0,
                          backgroundColor: isInside ? Colors.green : Colors.red,
                        ),
                        const SizedBox(width: 10.0),
                        Text(isInside ? "Inside" : "Outside"),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 30.0,
                  )
                ],
              ),
              Expanded(
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: kBorder,
                    child: QrImage(
                      data: encodedJson,
                      version: QrVersions.auto,
                      size: 270,
                      gapless: true,
                      errorStateBuilder: (cxt, err) {
                        return Center(
                          child: Text(
                            "Uh oh! Something went wrong...",
                            textAlign: TextAlign.center,
                            style: kprofileDescriptionText,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
