import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mental_health_app/Screen/chat.dart';
import 'package:mental_health_app/Screen/home.dart';
import 'package:mental_health_app/Screen/wellness.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';



class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late PageController _pageController;
  int selectedIndex = 0;
  bool _colorful = false;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: selectedIndex);
  }

  void onButtonPressed(int index) {
    setState(() {
      selectedIndex = index;
    });
    _pageController.animateToPage(selectedIndex,
        duration: const Duration(milliseconds: 400), curve: Curves.easeOutQuad);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     //resizeToAvoidBottomInset: false,
      body: Column(
        
        children: <Widget>[
    
          Expanded(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              children: _listOfWidget,
              
            ),
          ),
        ],
      ),
      bottomNavigationBar:SlidingClippedNavBar(
              backgroundColor: Colors.white,
              onButtonPressed: onButtonPressed,
              iconSize: 30,
              activeColor:  Colors.black,
              selectedIndex: selectedIndex,
              barItems: <BarItem>[
                BarItem(
                 
                  icon: Ionicons.home,
                  title: 'Home',
                ),
                BarItem(
                 icon: Ionicons.heart,
                  title: 'Exercise',
                ),
                BarItem(
                  
                   icon: Ionicons.chatbubble,
                  title: 'Therepist',
                ),

              ],
            ),
    );
  }
}

// icon size:24 for fontAwesomeIcons
// icons size: 30 for MaterialIcons

List<Widget> _listOfWidget = <Widget>[
  
  HomeScreen(),
  Wellness(),
  Chat(),
];