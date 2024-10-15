import 'package:flutter/material.dart';
import 'package:login2/components/register/registercomponent.dart';
import 'package:login2/size_config.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});
  static String routeName = "/sign_up";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: const RegisterComponent(),
    );
  }
}
