import 'dart:convert';

import 'package:grpc/grpc.dart';
import 'package:iversion/database/my_details_box_handler.dart';
import 'package:iversion/grpc/message/message_service.pbgrpc.dart';
import 'package:iversion/pages/video_call/signaling.dart';
import 'package:iversion/utils/grpc_channel/grpc_channel.dart';

const CLIENT_ID_EVENT = 'client-id-event';
const OFFER_EVENT = 'offer-event';
const ANSWER_EVENT = 'answer-event';
const ICE_CANDIDATE_EVENT = 'ice-candidate-event';

class VideoCallController {
  static var signal = Signaling();

  //listenMessage will be called from runner class and execute things.
  static listenMessage(dynamic messages) {
    //signal.onMessage(eventType, message);
  }

  static emitICECandidateEvent(
      String toUserId, Map<String, dynamic> iceCandidate) {
    emitWebRTCEvents(
        ICE_CANDIDATE_EVENT, toUserId, jsonEncode(iceCandidate).toString());
  }

  static emitWebRTCEvents(String eventType, toUserId, jsonPayload) async {
    try {
      var grpcChannel = GrpcClientChannel.getChannel();
      var messageStub = MessageClient(grpcChannel,
          options: CallOptions(timeout: Duration(seconds: 2)));
      var requestPayload = emitWebRTCeventsRequest()
        ..toUserId = toUserId
        ..fromUserId = MyDetailsBoxHandler.userId
        ..eventType = eventType
        ..dynamicPayload = jsonPayload;
      var resp = await messageStub.emitWebRTCevents(requestPayload);
      if (resp.message == "") {
        print("error while emitting web rtc event");
        print(resp.err.toString());
      } else {
        print("Successfully emitted the event");
      }
    } catch (er) {
      print("error while emitting event $eventType");
      print(er);
      throw er;
    }
  }

  static emitAnswerEvents(toUserId, Map<String, dynamic> answerE) {
    try {
      print("Emitting answer event");
      emitWebRTCEvents(ANSWER_EVENT, toUserId, jsonEncode(answerE));
    } catch (er) {
      print(er);
      print("Error while emitting answer events");
    }
  }

  static emitOfferEvents(toUserId, Map<String, dynamic> answerE) {
    try {
      emitWebRTCEvents(OFFER_EVENT, toUserId, jsonEncode(answerE));
    } catch (er) {
      print(er);
      print("Error while emitting offer events");
    }
  }

  static listenForEvents(UserChatMessage WebRTCEvent) {
    var messageToLocalEventType = {};
    var decodedJson = jsonDecode(WebRTCEvent.dynamicJSONString);
    signal.onMessage(
        WebRTCEvent.webRTCEventType, WebRTCEvent.fromUserId, decodedJson);
  }
}
