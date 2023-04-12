import 'package:flutter/material.dart';
import "package:intl/intl.dart";

import "package:mental_health_app/Riverpod/chatpod.dart";
import "package:mental_health_app/data/api_call_chat.dart";
//import "package:mental_health_app/data/data_health.dart";
import "package:riverpod/riverpod.dart";
import 'dart:async';

import "package:uuid/uuid.dart";

final mhChatProvider=StateNotifierProvider<ChatList,List<MhChat>>((ref)=> ChatList([],ref));

class ChatList extends StateNotifier<List<MhChat>> {
  Ref ref;
  Timer? receiverTimer;
  ChatList(List<MhChat> state,this.ref): super(state);
  add (){
     String msg=ref.read(ChatTextProvider).text.trim();
     print("add:msg:$msg");
     state=[...state, MhChat(
        uid: const Uuid().v4(),
        msg: msg,
        isSend: true,
         profileImg: "image/acc.jpg",
          time: DateFormat.jm().format(DateTime.now()),
          ),
     ];

     receiverTimer ??= Timer(const Duration(milliseconds: 500), () { 
      state=[...state, MhChat(
        uid: const Uuid().v4(),
        msg: "Got it",
        isSend: false,
         profileImg: "image/acc.jpg",
         time: DateFormat.jm().format(DateTime.now()),
          ),
   ]; 
   receiverTimer?.cancel();
   receiverTimer=null;
   });
  }
  
}