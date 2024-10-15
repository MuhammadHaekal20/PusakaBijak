import 'package:flutter/material.dart';
import 'package:login2/components/login/loginform.dart';
import 'package:login2/size_config.dart';
import 'package:login2/utils/constants.dart';
import 'package:simple_shadow/simple_shadow.dart';

class LogInComponent extends StatefulWidget {
  const LogInComponent({super.key});

  @override
  LogInComponentState createState() => LogInComponentState();
}

class LogInComponentState extends State<LogInComponent> {
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
                    // SizedBox(
                    //   height: SizeConfig.screenHeight * 0.04,
                    // ),
                    SizedBox(
                      height: SizeConfig.screenHeight * 0.04,
                    ),
                    SimpleShadow(
                      opacity: 0.5,
                      color: kSecondaryColor,
                      offset: const Offset(5, 5),
                      sigma: 2,
                      child: Image.asset(
                        "assets/images/logopta2.png",
                        height: 100,
                        width: 202,
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight * 0.04,
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Login Details",
                              style: mTitleStyle,
                            )
                          ],
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    const SignInForm()
                  ],
                ),
              ),
            )));
  }
}
