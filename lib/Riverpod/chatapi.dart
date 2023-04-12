// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mental_health_app/Riverpod/chatpod.dart';
import 'package:mental_health_app/data/mhchat.dart';

class ChatScreen extends ConsumerWidget {
  const ChatScreen({super.key});
final double pi=3.142;
  @override
  Widget build(BuildContext context,ref) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.black,width: 1.5),
      ),
      child: Column(
        children: [
          Expanded(
            child:  Consumer(
            builder: (context,ref,_){

              final item=ref.watch(mhChatProvider);
              return ListView.builder(
              //itemCount: ref.read(mhChatProvider).length,
              itemCount: item.length,
              itemBuilder: (context,index){
                if (item[index].isSend == true) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      children: [
                        Text(item[index].time ?? "??:??"),
                        Spacer(),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                          decoration: BoxDecoration(
                            color: Colors.blueGrey[50],
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(24),
                              topLeft: Radius.circular(24),
                              bottomLeft: Radius.circular(24),
                            )
                          ),
                          child: Text("${item[index].msg}"),
                        ),
                      ],
                    ),
                  );
                  
                }
               //var item=ref.read(mhChatProvider);
               return Padding(
                 padding: const EdgeInsets.symmetric(vertical: 8.0),
                 child: Row(
                  children: [
                    Container(
                      height: 38,
                      width: 38,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 1,
                          
                        ),
                        image: DecorationImage(image: AssetImage(item[index].profileImg ?? ""),
                        fit: BoxFit.cover,
                        )
                      ),
                    ),
                    SizedBox(width: 8,),
                     Container(
                            padding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                            decoration: BoxDecoration(
                              color: Colors.blueGrey[50],
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(24),
                                topLeft: Radius.circular(24),
                                bottomRight: Radius.circular(24),
                              )
                            ),
                            child: Text("${item[index].msg}"),
                          ),
                          const Spacer(),
                          Text(item[index].time ?? "?? ??"),
                  ],
                 ),
               ); 
            });
            },
             
          )),
          SizedBox(
            height: 24,
          ),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            height: 60,
            decoration: BoxDecoration(
             // color: Colors.yellow,
              borderRadius: BorderRadius.circular(36),
              border: Border.all(color: Colors.black,width: 1.5),
            ),
            child: Row(
              children: [
                Expanded(child: TextField(
                  controller: ref.read(ChatTextProvider),
                  onSubmitted: (v){
                    print("Onsubmitted()");
                       print(v);
                  },
                  onEditingComplete: (){
                      print("OnEditingComplete()");
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Release Your Stress here...",

                  ),
                )),
                SizedBox(width: 16),
                GestureDetector(
                  onTap:(){
                    if (ref.read(ChatTextProvider).text.isNotEmpty) {
                       ref.read(mhChatProvider.notifier).add();
                    ref.read(ChatTextProvider).clear();
                     FocusManager.instance.primaryFocus?.unfocus();
                    }
                   
                     
                  },
                  child: Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black,width: 1.5),
                      color: Colors.yellow,
                     
                    ),  
                    child: Center(
                      child: Transform.rotate(angle: -pi/4, child: Icon(Icons.send,size: 20,)),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}