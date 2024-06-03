

import 'package:flutter/material.dart';
import 'package:utkarsh_aichatbot/helper/global.dart';
import 'package:utkarsh_aichatbot/screen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    //waiting sometime for splash screen then moving to homescreen
    Future.delayed( const Duration (seconds: 2) ,(){
Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=> const HomeScreen()));//material page route means routing one page to other page(navigating to it)
    }
    );
    
  }
  @override
  //intializing logo size in splash screen
  Widget build(BuildContext context) {

    mq = MediaQuery.sizeOf(context);
    return Scaffold(

      body: Center(child: Card(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Padding(
          padding:  EdgeInsets.all(mq.width * .05),//adding dynamic size of the logo inside the card rather than const which will be better
          child: Image.asset("assets/images/logo.png",width: mq.width * .45,),
        ),//45% of the whole screen

      ),
      ),
    );
  }
}
