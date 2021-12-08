import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:iversion/consts/ui_pages.dart';
import 'package:iversion/main.dart';
import 'package:iversion/pages/video_call/video_call_controller.dart';

enum SignalingState {
  CallStateNew,
  CallStateRinging,
  CallStateInvite,
  CallStateConnected,
  CallStateBye,
  ConnectionOpen,
  ConnectionClosed,
  ConnectionError,
}

typedef void SignalingStateCallback(SignalingState state);
typedef void StreamStateCallback(MediaStream stream);

class Signaling {
  MediaStream sLocalStream;
  List<MediaStream> sRemoteStream;
  StreamStateCallback onLocalStream;
  StreamStateCallback onAddRemoteStream;
  StreamStateCallback onRemoveRemoteStream;
  SignalingStateCallback onStateChange;
  RTCPeerConnection _peerConnection;
  var _remoteCandidates = [];

  Signaling();
  Map<String, dynamic> _iceServers = {
    'iceServers': [
      {'url': 'stun:stun.l.google.com:19302'},
      /*
       * turn server configuration example.
      {
        'url': 'turn:123.45.67.89:3478',
        'username': 'change_to_real_user',
        'credential': 'change_to_real_secret'
      },
       */
    ]
  };
  //video calling constraints
  final Map<String, dynamic> _constraints = {
    'mandatory': {
      'OfferToReceiveAudio': true,
      'OfferToReceiveVideo': true,
    },
    'optional': [],
  };
  final Map<String, dynamic> _config = {
    'mandatory': {},
    'optional': [
      {'DtlsSrtpKeyAgreement': true},
    ],
  };

  startSignaling(String toUserId) async {
    print("Creating peer connection");
    _createPeerConnection(toUserId).then((pc) {
      print("Peer connection successful");
      _peerConnection = pc;
      _createOffer(toUserId, pc);
    }).catchError((er) {
      print("Error while creating peer connection");
      bye();
    });
  }

  _createOffer(String toUserId, RTCPeerConnection pc) async {
    try {
      print("Inside create offer");
      RTCSessionDescription spc = await pc.createOffer(_constraints);
      pc.setLocalDescription(spc);

      print(spc.toString());
      final description = {'sdp': spc.sdp, 'type': spc.type};
      print(description);
      emitOfferEvents(toUserId, description);
    } catch (er) {
      print('error while creating offer');
      print(er.toString());
    }
  }

  _createAnswer(String toUserId, RTCPeerConnection pc) async {
    try {
      RTCSessionDescription s = await pc.createAnswer(_constraints);
      pc.setLocalDescription(s);
      final description = {'sdp': s.sdp, 'type': s.type};
      emitAnswerEvents(toUserId, description);
    } catch (e) {
      print(e.toString());
    }
  }

  createLocalStream({isHost: true}) async {
    final Map<String, dynamic> mediaConstraints = {
      'audio': true,
      'video': {
        'mandatory': {
          'minWidth':
              '540', // Provide your own width, height and frame rate here
          'minHeight': '720',
          'minFrameRate': '20',
        },
        'facingMode': 'user',
        'optional': [],
      }
    };
    MediaStream stream = await MediaDevices.getUserMedia(mediaConstraints);

    if (this.onLocalStream != null) {
      print("Setting local stream");
      this.onLocalStream(stream);
    }
    return stream;
  }

  Future<RTCPeerConnection> _createPeerConnection(toUserId,
      {isHost = true}) async {
    //get local stream of camera
    print("creating peer connection");
    sLocalStream = await createLocalStream();
    print("local stream setted");
    //this will create a peer connection from stun server
    RTCPeerConnection pc = await createPeerConnection(_iceServers, _config);
    //adding local stream to peer connection object
    pc.addStream(sLocalStream);
    print("Printing peer connection object");
    print(pc.toString());
    pc.onIceCandidate = (candidate) {
      final iceCandidate = {
        'sdpMLineIndex': candidate.sdpMlineIndex,
        'sdpMid': candidate.sdpMid,
        'candidate': candidate.candidate,
      };
      print(iceCandidate);
      emitICEEvents(toUserId, iceCandidate);
    };

    print('Turn on speaker phone');
    sLocalStream.getAudioTracks()[0].enableSpeakerphone(true);

    pc.onIceConnectionState = (state) {
      print('onIceConnectionState $state');
      if (state == RTCIceConnectionState.RTCIceConnectionStateClosed ||
          state == RTCIceConnectionState.RTCIceConnectionStateFailed) {
        // bye();
      }
    };

    pc.onAddStream = (stream) {
      if (this.onAddRemoteStream != null) this.onAddRemoteStream(stream);
      print("Setting remote stream booyah");
      print(stream.id);
      sRemoteStream = [stream];
    };

    pc.onRemoveStream = (stream) {
      if (this.onRemoveRemoteStream != null) this.onRemoveRemoteStream(stream);
      sRemoteStream.removeWhere((it) {
        return (it.id == stream.id);
      });
    };
    return pc;
  }

  bye() {
    print("hanging up the call");
    if (this.sLocalStream != null) {
      this.sLocalStream.dispose();
      this.sLocalStream = null;
    }
    if (_peerConnection != null) {
      _peerConnection.dispose();
      _peerConnection = null;
    }
    if (this.onStateChange != null) {
      this.onStateChange(SignalingState.CallStateBye);
    }
  }

  void onMessage(eventType, fromUserId, message) async {
    switch (eventType) {
      case ICE_CANDIDATE_EVENT:
        //reset remote candidates and only when the user is not on a call already.
        _remoteCandidates.clear();
        print("redirecting to video call page");
        print("received ice candidate event $eventType");
        var candidateMessage = message;
        if (candidateMessage != null) {
          var pc = _peerConnection;
          RTCIceCandidate candidate = RTCIceCandidate(
              candidateMessage['candidate'],
              candidateMessage['sdpMid'],
              candidateMessage['sdpMLineIndex']);
          if (pc != null) {
            print("inside OnMessage: Peer connection was setted ");
            await pc.addCandidate(candidate);
          } else {
            print(
                "OnMessage: peer connection not found . Adding this as remote candidates");
            _remoteCandidates.add(candidate);
          }
        }
        break;
      case OFFER_EVENT:
        {
          print("OFFER EVENT  received offer event");
          var description = message;
          if (this.onStateChange != null) {
            //this would mean to create a new Video widget in recievers phone
            this.onStateChange(SignalingState.CallStateNew);
          }
          print("INSIDE OFFER_EVENT");
          var pc = await _createPeerConnection(fromUserId, isHost: false);
          _peerConnection = pc;
          await pc.setRemoteDescription(
              RTCSessionDescription(description['sdp'], description['type']));
          await _createAnswer(fromUserId, pc);
          if (this._remoteCandidates.length > 0) {
            _remoteCandidates.forEach((candidate) async {
              await pc.addCandidate(candidate);
            });
            _remoteCandidates.clear();
          }
          //create a new flutter screen
          navigatorKey.currentState.pushNamed(UiPages.video_call);
          break;
        }
      case ANSWER_EVENT:
        {
          print("Got answer event and processing answer event");
          var description = message;
          var pc = _peerConnection;
          if (pc != null) {
            await pc.setRemoteDescription(
                RTCSessionDescription(description['sdp'], description['type']));
          }
        }
        break;
    }
  }

  void emitICEEvents(String toUserId, Map<String, dynamic> iceCandidate) {
    VideoCallController.emitICECandidateEvent(toUserId, iceCandidate);
  }

  void emitAnswerEvents(String toUserId, Map<String, dynamic> answerSDP) {
    VideoCallController.emitAnswerEvents(toUserId, answerSDP);
  }

  void emitOfferEvents(String toUserId, Map<String, dynamic> offerEventSDP) {
    VideoCallController.emitOfferEvents(toUserId, offerEventSDP);
  }
}
