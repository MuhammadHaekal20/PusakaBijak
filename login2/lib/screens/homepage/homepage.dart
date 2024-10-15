import 'package:flutter/material.dart';
import 'package:login2/components/waris/waris1.dart';
import 'package:login2/screens/reminder/reminderscreens.dart';
import 'package:login2/utils/constants.dart';
import 'package:login2/screens/dialogbox/dialogboxscreens.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login2/screens/login/loginscreens.dart';
import 'package:login2/components/zakat/zakat.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static String routeName = "/home_page";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  final FocusNode myFocusNode = FocusNode();
  String? username;
  String? email;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _loadUserData();
    _showDialogOnFirstLaunch();
    // Menampilkan dialog box saat halaman pertama kali dibuka setelah login
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showDialog();
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _showDialogOnAppResumed();
    }
  }

  Future<void> _loadUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      String? name = user.displayName;
      String? userEmail = user.email;

      setState(() {
        username = name ?? "User";
        email = userEmail ?? "user@example.com";
      });

      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      if (userDoc.exists) {
        Map<String, dynamic>? data = userDoc.data() as Map<String, dynamic>?;
        if (data != null) {
          setState(() {
            username = data['username'] ?? username;
            email = data['email'] ?? email;
          });
        }
      }
    } else {
      // User tidak terautentikasi
      setState(() {
        username = "User";
        email = "user@example.com";
      });
    }
  }

  Future<void> _showDialogOnFirstLaunch() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstLaunch = prefs.getBool('isFirstLaunch') ?? true;

    if (isFirstLaunch) {
      _showDialog();
      prefs.setBool('isFirstLaunch', false);
    }
  }

  Future<void> _showDialogOnAppResumed() async {
    _showDialog();
  }

  void _showDialog() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return DialoxBoxScreen(); // Gunakan dialog box dari file terpisah
        },
      );
    });
  }

  void _launchURL() async {
    final Uri url = Uri.parse('https://baznas.go.id/bayarzakat');
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading:
            false, // Menonaktifkan panah kembali otomatis
        title: Padding(
          padding: const EdgeInsets.only(left: 10, top: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: Text(
                  "Hai $username!",
                  style: mTitleStyle.copyWith(fontSize: 20),
                ),
              ),
              const Spacer(),
              IconButton(
                icon: SvgPicture.asset(
                  'assets/icons/calendar.svg',
                  height: 24,
                  width: 24,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, ReminderScreen.routeName);
                },
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                // Tindakan yang dilakukan saat gambar diklik
                Navigator.pushNamed(context, MainMenuPage.routeName);
              },
              child: Image.asset(
                'assets/images/Dompet.png',
                height: 60,
                width: 60,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Zakat',
              style: mTitleStyle,
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                // Navigasi ke halaman lain saat image ditekan
                Navigator.pushNamed(context, MyHomePage.routeName);
              },
              child: Image.asset(
                'assets/images/Pie.png',
                height: 60,
                width: 60,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Waris',
              style: mTitleStyle,
            ),
          ],
        ),
      ),
      endDrawer: Drawer(
        child: Container(
          color: Colors.white,
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 0.5),
                  border: Border(
                    bottom: BorderSide(
                      color: kPrimaryColor,
                      width: 1.0,
                    ),
                  ),
                ),
                accountName: Text(
                  "Hai $username!",
                  style: const TextStyle(
                    color: kPrimaryColor,
                  ),
                ),
                accountEmail: Text(
                  "$email",
                  style: const TextStyle(
                    color: kPrimaryColor,
                  ),
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundColor:
                      myFocusNode.hasFocus ? mSubtitleColor : kPrimaryColor,
                  child: Text(
                    username != null ? username![0] : "U",
                    style: const TextStyle(fontSize: 40.0, color: Colors.white),
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.contact_phone),
                title: const Text('Contact'),
                onTap: () {
                  // Aksi ketika menu item Contact dipilih
                  _launchURL();
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Log Out'),
                onTap: () async {
                  // Aksi ketika menu item Log Out dipilih
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushReplacementNamed(
                      context, LogInScreen.routeName);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
