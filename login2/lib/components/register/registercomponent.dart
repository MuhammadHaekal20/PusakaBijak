import 'package:flutter/material.dart';
import 'package:login2/components/register/registerform.dart';
import 'package:login2/size_config.dart';
import 'package:login2/utils/constants.dart';

class RegisterComponent extends StatefulWidget {
  const RegisterComponent({super.key});

  @override
  RegisterComponentState createState() => RegisterComponentState();
}

class RegisterComponentState extends State<RegisterComponent> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenHeight(20)),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        "Registrasi",
                        style: mTitleStyle.copyWith(fontSize: 20),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const RegisterForm()
                  ],
                ),
              ),
            )));
  }
}
