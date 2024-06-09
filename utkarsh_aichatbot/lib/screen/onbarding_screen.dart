import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:utkarsh_aichatbot/helper/global.dart';
import 'package:utkarsh_aichatbot/model/onboard.dart';


class OnbardingScreen extends StatelessWidget {
  const OnbardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = PageController();
    final list = [
      //onboarding 1
      Onboard(
          title: "Ask Me Anything",
          subtitle:
              "I can be your best friend & you can ask me anything & I will help you!",
          lottie: "ai_ask_me"),
      //onboarding 2
      Onboard(
          title: "Imagination to Reality",
          subtitle: "Just Imagine Something in your Mind and I will Create it ",
          lottie: "ai_play")
    ];

    return Scaffold(
      body: PageView.builder(
        controller: c,
        itemCount: list.length,
        itemBuilder: (ctx, ind) {
          final isLast = ind == list.length - 1;
          return Column(
            children: [
              //lottie
              Lottie.asset(
                'assets/lottie/${list[ind].lottie}.json',
                height: mq.height * .7,
              ),
              //title
              Text(
                list[ind].title,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    letterSpacing: .5),
              ),
              //for adding space
              SizedBox(
                height: mq.height * .01,
              ),
              // const Spacer(),
              //subtitle
              SizedBox(
                width: mq.width * .7,
                child: Text(
                  list[ind].subtitle,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 13.5, letterSpacing: .5, color: Colors.black54),
                ),
              ),
              const Spacer(),
              //dots
              Wrap(
                spacing: 10,
                children: List.generate(
                    list.length,
                    (i) => Container(
                          width: i == ind ? 17 : 10,
                          height: 8,
                          decoration: BoxDecoration(
                              color: i == ind ? Colors.blue : Colors.grey,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5))),
                        )),
              ),
              const Spacer(),
              //buttons
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      elevation: 0,
                      textStyle: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.black,
                      minimumSize: Size(mq.width * .4, 50)),
                  onPressed: () {
                    if (isLast) {
                      // Navigator.of(context).pushReplacement(MaterialPageRoute(
                      //     builder: (_) => const HomeScreen()));
                    } else {
                      c.nextPage(
                          duration: const Duration(milliseconds: 600),
                          curve: Curves.ease);
                    }
                  },
                  child: Text(isLast ? 'Finish' : 'Next')),
              const Spacer(),
            ],
          );
        },
      ),
    );
  }
}
