

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class Pref{
  static late Box _box;
  static void initialize() async{
     Hive.defaultDirectory = (await getApplicationDocumentsDirectory()).path;//for initializing hive into app directory
     _box = Hive.box(name: 'myData');

  }

  static bool get showOnboarding =>
  _box.get('showOnboarding',defaultValue: true);

  static set showOnboarding(bool v) => _box.put('showOnboarding', v);
}