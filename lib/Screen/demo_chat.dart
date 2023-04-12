// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mental_health_app/Riverpod/chatapi.dart';
import 'package:mental_health_app/Riverpod/riverpod.dart';


class DChat extends StatelessWidget {
  const DChat({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      //appBar:AppBar(backgroundColor: Colors.white,) ,
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24,),
            Padding(  
              
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          image: DecorationImage(image:AssetImage("image/counseler.jpg"),
                          fit: BoxFit.fitHeight,
                          )
                        )
                      ),
              // SizedBox(width: 10,),
               Text("Cope with Pain"),
              Icon(Icons.more_horiz)
      
            ],
          ),
          
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 64,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                border: Border.all(color: Colors.black),
                color: Colors.blue,
          
              ), 
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
                child: Consumer(
                 builder: (context,ref,_){
                final topTab=  ref.watch(mhChatTabProvider);
                   return Row(
                    children: [
                      Expanded(child: GestureDetector(
                        onTap: (){
                          ref.read(mhChatTabProvider.notifier).state=0;
                        },
                        child: topTab==0 ? Container(
                        decoration: BoxDecoration(
                          color: Colors.yellow,
                          border: Border.all(color: Colors.black,width: 1.5,),
                          borderRadius: BorderRadius.circular(24)
                        ),
                        child:  Center(
                          child: const Text(
                          "Consult",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                          ),
                        ),
                      ) : Center(
                        child: const Text(
                          "Consult",style: TextStyle(color: Colors.white),
                          ),
                      ),
                      )),
                        SizedBox(width: 12,),
                      Expanded(child: GestureDetector(
                        onTap: (){
                          ref.read(mhChatTabProvider.notifier).state=1;
                        },
                        child: topTab==1 ? Container(
                        decoration: BoxDecoration(
                          color: Colors.yellow,
                          border: Border.all(color: Colors.black,width: 1.5,),
                          borderRadius: BorderRadius.circular(24)
                        ),
                        child:  Center(
                          child: const Text(
                          "Therapy",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                          ),
                        ),
                      ) : Center(
                        child: const Text(
                          "Therapy",style: TextStyle(color: Colors.white),
                          ),
                      ),
                      )),
                    ],
                  );
                 }
                ),
              )
               
              ),
            ),
      
          Consumer(builder: (context,ref,_){
              final topTab=ref.watch(mhChatTabProvider);
              switch(topTab){
                case 0:
                return const Expanded(child:
                Padding(
                  padding:EdgeInsets.all(8.0),
                  child: //Placeholder(),
                  ChatScreen(),
                  ),
                 );
              case 1:
               return Container();
              default:
                return Container();
              }
              
          }
            ),
        
          ],
        ),
    );
  }
}