import 'package:freezed_annotation/freezed_annotation.dart';
part 'mh_chat.freezed.dart';
@freezed
class MhChat with _$MhChat{
  factory MhChat({
    String uid,
    String msg,
    bool isSend,
    String profileImg, 
    String time,
     
})=_MhChat;
}

