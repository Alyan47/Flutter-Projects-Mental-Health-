// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:coolicons/coolicons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:holding_gesture/holding_gesture.dart';
import 'package:mental_health_app/Riverpod/chatapi.dart';
import 'package:mental_health_app/Screen/chat.dart';
import 'package:mental_health_app/Screen/demo_chat.dart';
import 'package:mental_health_app/data/data_health.dart';
import 'package:url_launcher/url_launcher.dart';
class HomeScreen extends StatefulWidget {
   HomeScreen({super.key});
 

  @override
  State<HomeScreen> createState() => _HomeScreenState();
  
}

class _HomeScreenState extends State<HomeScreen> {
   bool toggle =true;
   
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                Text('Mental Health App',
                style: GoogleFonts.balsamiqSans(fontWeight: FontWeight.bold,color: Colors.grey
                ),
                 
                ),
                Spacer(),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: Colors.black,
                      width: 1.5, 
                    )
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 12,vertical: 4),
                  child: Text("SOS",
                  style: GoogleFonts.balsamiqSans(fontWeight: FontWeight.bold  ),
                  ),


                ),
                IconButton(
                onPressed: (){}, 
                icon:Icon(Coolicons.settings_future),
                )
              ],
            ) ,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border:Border.all(
                        color: Colors.black,
                        width: 1.5, 
                      ),
                      image: DecorationImage(image: AssetImage("image/acc.jpg")),
                      color: Colors.black
                    ),
                    
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Hello Dream-Walker",style: GoogleFonts.balsamiqSans(fontWeight: FontWeight.bold,fontSize: 18 ) ),
                        SizedBox(height: 8,),
                        Text("Let's Cure your Mental Health",style: GoogleFonts.balsamiqSans(color: Colors.grey,fontSize: 12)),
                  
                  
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 8,),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Use Voice in Menta",style: GoogleFonts.balsamiqSans(
                    fontWeight:FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 16,),
                Container(
                  height: 90,
                  decoration: BoxDecoration(
                    color: Colors.cyan[100],
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.black,width: 1.5),

                  ),
                  padding: EdgeInsets.all(16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Release Your Stress here!! " , style: GoogleFonts.balsamiqSans(
                        fontSize: 14, fontWeight:FontWeight.bold)
                           ),
                          SizedBox(height: 8,), 
                        Text("Talk through your anxiety",style: GoogleFonts.balsamiqSans(
                     
                        fontWeight: FontWeight.w300,
                        )),

                        ],
                      ),
                      Spacer(),
                      Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white, 
                      ),
                      padding: EdgeInsets.all(4),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all( color: Colors.black)
                        ),
                        child: HoldDetector(
                           onHold: (){
                            setState(() {
                                toggle=false;
                            });
                           },
                           onCancel: (){
                            setState(() {
                              toggle=true;
                            });
                           },
                           holdTimeout: Duration(milliseconds: 200),
                           enableHapticFeedback: true,
                          child:IconButton(
                          icon:toggle?Icon(Icons.mic):Icon(Icons.stop),
                          onPressed: (){}, 
                          )
                          
                        ),
                      ),
                    ),
                      
                    ],
                  ),
                )
                ],
              ),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Text("Self Care"),
                Spacer(),
                Column(
                  children: [
                    Text("See All"),
                    SizedBox(height: 4,),
                    Container(
                      height: 3,
                      width: 84,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 16,),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: SizedBox(height: 100,
          
            child: ListView.builder(itemBuilder: (context,index){
            
              return Padding(
                padding: const EdgeInsets.only(right: 12),
                
                child: Column(
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border:Border.all(
                          color:Colors.black,
                          
                        )
                      ),
                      padding: EdgeInsets.all(2),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          image: DecorationImage(image: AssetImage(img[index]))
                        ),
                      ),
                    ),

                    SizedBox(height: 12,),
                    Text(name[index],style:GoogleFonts.balsamiqSans(
                    fontWeight: FontWeight.w300, color: Colors.black)),
                  ],
                ),
              );
            },
            itemCount:7,
            scrollDirection: Axis.horizontal,
            
            )
         ),
          ),
          SizedBox(height: 16,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text("Want Some Counselling?",style: GoogleFonts.balsamiqSans(
           fontWeight: FontWeight.bold),
           ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
             
              height: 110,
              decoration: BoxDecoration(
                 color: Colors.cyan[200],
                border: Border.all(color: Colors.black,
                width: 1.5,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  
                  Container(
                    height: 84,
                    width: 84,
                    decoration: BoxDecoration(
                      image: DecorationImage(image:AssetImage("image/s1.png"),
                      fit: BoxFit.fitHeight,
                      )
                    ),
                   
                  ),
                  SizedBox(width: 16,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("How are you Feeling?",style: TextStyle(fontWeight: FontWeight.bold),),
                      Container(
                        height: 41,
                        
                        decoration: BoxDecoration(color: Colors.yellow,
                        border: Border.all(
                          color: Colors.black,width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(24)
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 12,vertical: 4),
                        child: Center(
                          child:TextButton(onPressed: (){
                           Navigator.push(
                              context,
                             MaterialPageRoute(builder: (context) => const DChat()),
                            );
                          }
                            ,child:Text("Talk Now",style: TextStyle(color: Colors.black),),)
                         
                          )
                          
                          ),
                       
                        
                    ],
                  )
                ],
              ),
            ),

          ),
          ],
          
        ),
      ),
    );
  }
}