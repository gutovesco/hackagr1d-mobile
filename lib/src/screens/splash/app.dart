import 'package:teste_nottest/src/screens/splash/env.dart';

class App {


  static String _pkg = "gooey_edge";
  static String get pkg => Env.getPackage(_pkg);


}