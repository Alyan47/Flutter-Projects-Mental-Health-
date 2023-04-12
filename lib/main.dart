// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mental_health_app/widgets/navbar.dart';
import 'Screen/home.dart';
void main() {
 runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    //SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,overlays: []);
    return ProviderScope(
      child: MaterialApp(
        title: 'Mental Health App',
        debugShowCheckedModeBanner: false,
    
        // ignore: prefer_const_constructors
       // home:ProviderScope(child:HomeScreen(), ) 
       home:  MyHomePage(),
        //home: MyHomePage(),
      ),
    );
  }
}
