

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:utkarsh_aichatbot/helper/global.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
  
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);//it will show the bar ,edges,status_bar  etc.



  }
  @override
  //intializing logo size in splash screen
  Widget build(BuildContext context) {

    mq = MediaQuery.sizeOf(context);
    return const Scaffold(

      body: Center(child: Text("Welcome to HomeScreen")
      ),
    );
  }
}
