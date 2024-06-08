import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';
import 'package:utkarsh_aichatbot/helper/global.dart';
import 'package:utkarsh_aichatbot/model/home_type.dart';

class HomeCard extends StatelessWidget {
  final HomeType homeType;

  const HomeCard({super.key, required this.homeType});

  @override
  Widget build(BuildContext context) {
    // Animate.restartOnHotReload=true;
    return Card(
      color: Colors.blue.withOpacity(.25),
      elevation: 0,
      margin: EdgeInsets.only(bottom: mq.height * .02),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child:InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        onTap: homeType.OnTap,
        child: 
      homeType.leftAlign ?  Row(
        children: [
           //lottie
          Container(
            width: mq.width * 0.46,
            padding: homeType.padding,
            child: Lottie.asset("assets/lottie/${homeType.lottie}",
                width: mq.width * 0.46),
          ),
          const Spacer(),
          //title
          Text(
            homeType.title,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w600,
                letterSpacing: .5),
          ),
          const Spacer(
            flex: 2,
          ),
        ],
      ):  Row(
        children: [
          //title
          const Spacer(
            flex: 2,
          ),
          Text(
            homeType.title,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w600,
                letterSpacing: .5),
          ),
          const Spacer(),
          //lottie
          Container(
            width: mq.width * 0.46,
            padding: homeType.padding,
            child: Lottie.asset("assets/lottie/${homeType.lottie}",
                width: mq.width * 0.46),
          ),
          const Spacer(),
        ],
      ),
      )
    ).animate()
      .scale( duration: 1.4.seconds);
  }
}
