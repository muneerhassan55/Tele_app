// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tele_app/src/pages/call_page.dart';
import 'package:tele_app/src/pages/video_call.dart';
import 'package:tele_app/utils/app-constant.dart';

class CallHome extends StatelessWidget {
  final callIdTextController = TextEditingController();
  final callIdTextController1 = TextEditingController();
  CallHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: TextField(
                    controller: callIdTextController1,
                    decoration: InputDecoration(labelText: "Join Call By Id"),
                  )),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => CallPage(
                            callId: callIdTextController.text,
                          ));
                    },
                    child: Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                          color: AppConstant.appScendoryColor,
                          borderRadius: BorderRadius.circular(30)),
                      child: Center(
                          child: Text(
                        'Start Audio Call',
                        style: TextStyle(
                            color: AppConstant.appTextColor,
                            fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                ],
              ),

              //video
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: TextField(
                    controller: callIdTextController,
                    decoration: InputDecoration(labelText: "Join Call By Id"),
                  )),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => VideoCallPage(
                            callId: callIdTextController1.text,
                          ));
                    },
                    child: Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                          color: AppConstant.appScendoryColor,
                          borderRadius: BorderRadius.circular(30)),
                      child: Center(
                          child: Text(
                        'Start Video Call',
                        style: TextStyle(
                            color: AppConstant.appTextColor,
                            fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
