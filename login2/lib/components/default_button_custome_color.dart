import 'package:flutter/material.dart';

import '../size_config.dart';

class DefaultButtonCustomeColor extends StatelessWidget {
  const DefaultButtonCustomeColor({
    super.key,
    this.text,
    this.color,
    this.press,
  });
  final String? text;
  final Color? color;
  final Function? press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(56),
      child: TextButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(color!),
          overlayColor: MaterialStateProperty.all<Color>(Colors.white),
        ),
        onPressed: press as void Function()?,
        child: Text(
          text!,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(18),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
