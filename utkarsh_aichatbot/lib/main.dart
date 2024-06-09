import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:utkarsh_aichatbot/helper/global.dart';
import 'package:utkarsh_aichatbot/helper/pref.dart';
import 'package:utkarsh_aichatbot/screen/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); //we wrote this to ensure that the app is getting initialise for the fulscreen mode and orientation
  Pref.initialize(); //init hive
  Gemini.init(apiKey: ApiKey);

  await SystemChrome.setEnabledSystemUIMode(SystemUiMode
      .immersiveSticky); //we write await here because the flutterbindging will take time to initialise
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: appName,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
         // scaffoldBackgroundColor: Colors.grey.shade900,
          appBarTheme: const AppBarTheme(
            elevation: 1,
            foregroundColor: Colors.black,
            backgroundColor: Colors.white,
            centerTitle: true,
            iconTheme: IconThemeData(color: Colors.blue),
            titleTextStyle: TextStyle(
                color: Color.fromARGB(255, 21, 135, 228),
                fontSize: 20,
                fontWeight: FontWeight.w600),
          ),
        ),
        home: SplashScreen(),
      );
  }
}