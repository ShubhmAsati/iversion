import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:iversion/models/my_contacts_box.dart';
import 'package:iversion/pages/video_call/signaling.dart';
import 'package:iversion/pages/video_call/video_call_controller.dart';

class VideoCallingWidget extends StatefulWidget {
  List<MyContactsBoxModel> participants;
  VideoCallingWidget({this.participants});
  @override
  _VideoCallingWidgetState createState() =>
      _VideoCallingWidgetState(participants: this.participants);
}

class _VideoCallingWidgetState extends State<VideoCallingWidget> {
  List<MyContactsBoxModel> participants;
  RTCVideoRenderer _localRenderer = new RTCVideoRenderer();
  RTCVideoRenderer _remoteRenderer = new RTCVideoRenderer();
  bool onCalling = true;
  _VideoCallingWidgetState({this.participants});
  @override
  void initState() {
    super.initState();
    initRenderers();
    _initializeConnection();
  }

  @override
  void dispose() {
    super.dispose();
    _localRenderer.dispose();
    _remoteRenderer.dispose();
  }

  initRenderers() async {
    await _localRenderer.initialize();
    await _remoteRenderer.initialize();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: size.width,
          height: size.height,
          child: Stack(
            children: [
              new Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                      width: size.width,
                      height: size.height / 2,
                      child: RTCVideoView(_localRenderer))),
              new Positioned(
                  top: size.height / 2,
                  left: 0,
                  child: Container(
                      width: size.width,
                      height: size.height / 2,
                      child: RTCVideoView(_remoteRenderer))),
              new Positioned(
                  bottom: 80,
                  left: size.width * 0.43,
                  child: Center(
                    child: IconButton(
                      icon: Icon(
                        Icons.call_end,
                        color: Colors.red,
                        size: 50,
                      ),
                      onPressed: () {
                        _hangUp();
                        Navigator.pop(context);
                      },
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  _hangUp() {
    if (VideoCallController.signal != null) {
      VideoCallController.signal.bye();
    }
  }

  _initializeConnection() {
    print("Initializing localstream");
    VideoCallController.signal.onLocalStream = (stream) {
      setState(() {
        this._localRenderer.srcObject = stream;
      });
    };
    VideoCallController.signal.onStateChange = (state) {
      switch (state) {
        case SignalingState.CallStateBye:
          this.setState(() {
            _localRenderer.srcObject = null;
            _remoteRenderer.srcObject = null;
            onCalling = false;
          });
          break;
      }
    };
    VideoCallController.signal.onAddRemoteStream = (stream) {
      this.setState(() {
        _remoteRenderer.srcObject = stream;
      });
    };
    VideoCallController.signal.onRemoveRemoteStream = ((stream) {
      _remoteRenderer.srcObject = null;
    });
    VideoCallController.signal.startSignaling(participants[0].userId);
  }
}
