import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:utkarsh_aichatbot/helper/global.dart';
import 'package:utkarsh_aichatbot/helper/pref.dart';
import 'package:utkarsh_aichatbot/model/home_type.dart';
import 'package:utkarsh_aichatbot/widget/home_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.edgeToEdge); //it will show the bar ,edges,status_bar  etc.
    Pref.showOnboarding = false;
  }

  @override
  //intializing logo size in splash screen
  Widget build(BuildContext context) {
    mq = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          appName,
          style: TextStyle(
              color: Color.fromARGB(255, 21, 135, 228), fontSize: 20, fontWeight: FontWeight.w600),
        ),

//
        actions: [
          IconButton(
            padding: const EdgeInsets.only(right: 10),
              onPressed: () {},
              icon: const Icon(
                Icons.brightness_4_rounded,
                color: Colors.amber,
                size: 26,
              ))
        ],
      ),
      body: ListView(
        padding:  EdgeInsets.symmetric(horizontal: mq.width * .03,vertical: mq.height * .02),
        children: HomeType.values.map((e)=> HomeCard(homeType: e,)).toList(),
        )
    );
  }
}
