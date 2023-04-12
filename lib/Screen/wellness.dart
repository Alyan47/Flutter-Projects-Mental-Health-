// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import 'package:mental_health_app/data/data_health.dart';
import 'package:url_launcher/url_launcher.dart';


class Wellness extends StatelessWidget {
  Wellness({super.key});
final List<Uri> _url = [Uri.parse('https://www.youtube.com/watch?v=sHHeiR3eMUM'),
                       Uri.parse('https://www.youtube.com/watch?v=ANZfVnjCmXk'),
                       Uri.parse("https://dribbble.com/shots/16462848-Valore-404-page"),                                
                       Uri.parse('https://dribbble.com/shots/16462848-Valore-404-page'),                               
                       Uri.parse('https://dribbble.com/shots/16462848-Valore-404-page'),                                
                                                       ];
Future<void> _launchUrl(var _url) async {
      if (!await launchUrl(_url)) {
       throw Exception('Could not launch $_url');
  }
   }

  @override
  Widget build(BuildContext context) {
    return Column(
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
                      image: DecorationImage(image:AssetImage("image/wellness.png"),
                      fit: BoxFit.fitHeight,
                      )
                    )
                  ),
          // SizedBox(width: 10,),
           Text("Wellness"),
          Icon(Icons.more_horiz)

        ],
      ),
      
      ),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("5 Exercise",style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),),
              SizedBox(height: 16,),
              Text("The essential wellness part works to develop helpful beliefs about your life",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: Colors.grey,
              ),
              ),
              SizedBox(height: 24,),
              Row(
                children: [
                  Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: Colors.black, width: 1.5),
                          ),
                          child:  Container(
                            height: 27,
                            
                            child: Center(
                              child:TextButton(onPressed:(){}, child: Text(
                                "Unlock All",
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12,color: Colors.black),
                              ),)
                            ),
                          ),
                        ),
                      Spacer(),
                      Icon(Ionicons.thumbs_up_outline),  
                      SizedBox(width: 14,),
                      Icon(Ionicons.share_social),
                ],
            
              ),
                Padding(
              padding:const EdgeInsets.symmetric(vertical: 24) ,
              child: Divider(
                color: Colors.black,
      
              ),
              ),
              Text("5 Video Content"),
              SizedBox(height: 16,),
              Expanded(child: 
                 ListView.builder( itemCount: f.length,
                  itemBuilder: (context,index){
                    
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Container(
                      height: 110,
                      decoration: BoxDecoration(
                        border: Border.all( 
                          color: Colors.black,width: 1.5,
                          
                        ),
                        borderRadius: BorderRadius.circular(24),

                      ),
                     padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                              child: Row(
                                children: [

                                  GestureDetector(
                                     onTap: (){ _launchUrl(_url[index]);},
                                    child: Container(
                                      height: 100,
                                      width: 120,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(16),
                                          image: DecorationImage(
                                              image: AssetImage(
                                                //fakeWellness[index].img ?? "",
                                                f[index],
                                              ),
                                              fit: BoxFit.cover)
                                                
                                              ),
                                  
                                      child: Center(
                                        child: CircleAvatar(
                                          backgroundColor: (s[index])
                                              ? Colors.blue
                                              : Colors.red,
                                          foregroundColor: Colors.white,
                                          child: Icon((s[index])
                                              ? Icons.visibility
                                              : Icons.lock),
                                        ),
                                      ),
                                      
                                    ),
                                  ), 
                          Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                         title[index],
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black
                                          ),
                                        ),
                                        Text(
                                          subtitle[index],
                                          style: const TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                        Text(
                                          time[index],
                                          style: const TextStyle(fontSize: 12),
                                        ),         
            ]),
                  )])));
                 }),
                 )
            ],
          ),
        ),
      ) 

     
      ],
    );
  }
}