import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login2/routes.dart';
import 'package:login2/screens/homepage/homepage.dart';
import 'package:login2/screens/login/loginscreens.dart';
import 'package:login2/screens/reminder/notification_service.dart';
import 'package:login2/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().init();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Kalkulator Zakat dan Waris",
      theme: theme(),
      home: const SplashScreen(),
      routes: routes,
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    if (isLoggedIn) {
      FirebaseAuth auth = FirebaseAuth.instance;
      User? user = auth.currentUser;

      if (user != null) {
        user.getIdToken().then((idToken) {
          print('User ID: ${user.uid}');
          print('User Email: ${user.email}');
          print('ID Token: $idToken');
          Navigator.pushReplacementNamed(context, HomePage.routeName);
        }).catchError((error) {
          print('Error getting ID token: $error');
          Navigator.pushReplacementNamed(context, LogInScreen.routeName);
        });
      } else {
        Navigator.pushReplacementNamed(context, LogInScreen.routeName);
      }
    } else {
      Navigator.pushReplacementNamed(context, LogInScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/logopta2.png', // Ganti dengan path gambar Anda
          width: 200, // Atur ukuran sesuai kebutuhan
          height: 200,
        ),
      ),
    );
  }
}
