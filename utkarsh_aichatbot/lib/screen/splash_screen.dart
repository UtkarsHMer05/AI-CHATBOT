import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:utkarsh_aichatbot/helper/global.dart';
import 'package:utkarsh_aichatbot/helper/pref.dart';
import 'package:utkarsh_aichatbot/screen/home_screen.dart';
import 'package:utkarsh_aichatbot/screen/onbarding_screen.dart';
import 'package:utkarsh_aichatbot/widget/custom_loading.dart';

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
    Future.delayed(const Duration(seconds: 2), () 
    {
      // Navigator.of(context).pushReplacement(MaterialPageRoute(
      //     builder: (_) => Pref.showOnboarding ?  const OnbardingScreen() : const HomeScreen())
    
      //     ); //material page route means routing one page to other page(navigating to it)
      Get.off(()=>Pref.showOnboarding ? const OnbardingScreen() : const HomeScreen());
    } //routing to the onboarding screen
        );
  }

  @override
  //intializing logo size in splash screen
  Widget build(BuildContext context) {
    mq = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SizedBox(
        // we are putting sizebox because to put the logo in middle screen instead of left side
        width: double.maxFinite,
        child: Column(
          children: [
            const Spacer(
              flex: 2,
            ),
            Card(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Padding(
                padding: EdgeInsets.all(mq.width *
                    .05), //adding dynamic size of the logo inside the card rather than const which will be better
                child: Image.asset(
                  "assets/images/logo.png",
                  width: mq.width * .45,
                ),
              ),

              //45% of the whole screen
            ),
            const Spacer(),
            const CustomLoading(),

            const Spacer(), //loading custom lottie screen
          ],
        ),
      ),
    );
  }
}
