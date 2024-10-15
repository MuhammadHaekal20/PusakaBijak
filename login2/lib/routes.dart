import 'package:flutter/material.dart';
import 'package:login2/components/waris/waris1.dart';
import 'package:login2/components/zakat/zakat.dart';
import 'package:login2/screens/homepage/homepage.dart';
import 'package:login2/screens/login/loginscreens.dart';
import 'package:login2/screens/register/registscreens.dart';
import 'package:login2/screens/reminder/reminderscreens.dart';

final Map<String, WidgetBuilder> routes = {
  LogInScreen.routeName: (context) => const LogInScreen(),
  RegisterScreen.routeName: (context) => const RegisterScreen(),
  HomePage.routeName: (context) => HomePage(),
  ReminderScreen.routeName: (context) => const ReminderScreen(),
  MyHomePage.routeName: (context) => const MyHomePage(),
  MainMenuPage.routeName: (context) => const MainMenuPage(),
  ZakatFitrahPage.routeName: (context) => const ZakatFitrahPage(),
  ZakatMaalMenuPage.routeName: (context) => const ZakatMaalMenuPage(),
  ZakatIncomePage.routeName: (context) => const ZakatIncomePage(),
  ZakatTambakPage.routeName: (context) => ZakatTambakPage(),
  ZakatPerdaganganPage.routeName: (context) => const ZakatPerdaganganPage(),
  ZakatPeternakanPage.routeName: (context) => ZakatPeternakanPage(),
  ZakatPerusahaanPage.routeName: (context) => ZakatPerusahaanPage(),
  ZakatRikazPage.routeName: (context) => ZakatRikazPage(),
  ZakatPertanianPage.routeName: (context) => const ZakatPertanianPage(),
  ZakatEmasPerakPage.routeName: (context) => ZakatEmasPerakPage(),
};
