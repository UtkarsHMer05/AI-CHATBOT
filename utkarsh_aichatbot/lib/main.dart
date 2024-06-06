import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:utkarsh_aichatbot/helper/pref.dart';
import 'package:utkarsh_aichatbot/screen/splash_screen.dart';

 Future<void> main() async {
WidgetsFlutterBinding.ensureInitialized();//we wrote this to ensure that the app is getting initialise for the fulscreen mode and orientation
  Pref.initialize();//init hive


await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);//we write await here because the flutterbindging will take time to initialise
 await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]);


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


 @override
Widget build(BuildContext context) {
  return const MaterialApp(
    debugShowCheckedModeBanner: false,
    home:  SplashScreen(),
  );
}
}