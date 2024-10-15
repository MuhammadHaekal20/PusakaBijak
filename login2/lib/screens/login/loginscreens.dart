import 'package:flutter/material.dart';
import 'package:login2/components/login/logincomponent.dart';
import 'package:login2/size_config.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});
  static String routeName = "/sign_in";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: const LogInComponent(),
    );
  }
}
