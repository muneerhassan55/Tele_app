import 'package:flutter/material.dart';
import 'package:tele_app/main.dart';
import 'package:tele_app/utils/app-constant.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class VideoCallPage extends StatelessWidget {
  final String callId;
  VideoCallPage({required this.callId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ZegoUIKitPrebuiltCall(
        appID: AppConstant.appId,
        appSign: AppConstant.appSignIn,
        userID: localUserId,
        userName: "user_$localUserId",
        callID: callId,
        config: ZegoUIKitPrebuiltCallConfig
            .oneOnOneVideoCall(), // Use video call configuration
        // Add a listener or lifecycle method here if available
        // For example, if there's an 'onDispose' callback:
        onDispose: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
